/*
  ==============================================================================

    FlutterSetup.cpp
    Created: 21 Nov 2020 2:52:09pm
    Author:  Tom Duncalf

  ==============================================================================
*/

#include <JuceHeader.h>

#include "FlutterSetup.h"

@import UIKit;
@import Flutter;

// Based on https://github.com/audiooffler/JucyFluttering/

// for ios, dart/ffi won't be able to access 'extern "C" functions' without those attributes due to compiler optimizations
#if defined(_WIN32)
#define EXTERN_C extern "C" __declspec(dllexport)
#else
#define EXTERN_C extern "C" __attribute__((visibility("default"))) __attribute__((used))
#endif

// Example function callable from Dart... maybe the best way to do this in reality
// (how we do it with the React Native/JUCE stuff) is to expose one variadic function
// to Dart, something like "nativeCall (callbackMethodName, ...args)", and then you provide
// a mechanism for C++ code to register a new callback method and store them in a map...
// so you only have to register one native function which can then lookup the appropriate
// native code to callback.
EXTERN_C int32_t native_add (int32_t x, int32_t y) {
    juce::MessageManager::callAsync([] {
       DBG ("Hello from JUCE");
    });
    
    return x + y;
};

// Stores the ID of the port connection between C++ and Dart
static int64_t DartApiMessagePort = -1;

// Register the Dart API message part with C++
EXTERN_C void SetDartApiMessagePort(int64_t port)
{
  DartApiMessagePort = port;
};

// Initialise the Dart FFI API
// DL indicates it is the dynamically linked version: https://github.com/mraleph/go_dart_ffi_example/blob/94f367bedce7bef4f67c8175b70a351ca6a04e04/dart_api_dl/include/dart_api_dl.h
EXTERN_C int64_t InitializeDartApi(void *data)
{
  return Dart_InitializeApiDL(data);
};

// Functions to setup the Flutter application within the JUCE application
namespace JuceFlutter {

void setupFlutter()
{
    flutterEngine = [[FlutterEngine alloc] initWithName:@"my flutter engine"];
    [flutterEngine run];
}

// Start up the Flutter engine and add its view to our view hierarchy (right now taking over the
// whole JUCE app - doing things this way would enable you to embed Flutter within an existing app)
void addFlutterToView (void* view)
{
    FlutterViewController *flutterViewController =
            [[FlutterViewController alloc] initWithEngine:(FlutterEngine*)flutterEngine nibName:nil bundle:nil];
    [view addSubview: flutterViewController.view];
    [flutterViewController.view setFrame:[view bounds]];
}

// Example sending a message to Flutter - sends a load of points
void sendMsgToFlutter(int64_t msg)
{
  if (DartApiMessagePort == -1)
    return;

    int count = 10000;
    
    Dart_CObject valueObjs[count];
    Dart_CObject *valuesArray[count];
    
    for (int i = 0; i < count; i++)
    {
        float r = static_cast <float> (rand()) / static_cast <float> (RAND_MAX);
        
        // Construct a Dart_CObject for each value
        Dart_CObject value;
        value.type = Dart_CObject_kDouble;
        value.value.as_double = r;
    
        // Store the Dart_CObject
        valueObjs[i] = value;

        // Add a reference to the point to the array object
        valuesArray[i] = &valueObjs[i];
    }
    
    // Construct an array Dart_CObject wrapping the array of value Dart_CObject references
    Dart_CObject result;
    result.type = Dart_CObject_kArray;
    result.value.as_array.values = valuesArray;
    result.value.as_array.length = count;
    
    // Send the array over to Dart
    Dart_PostCObject_DL(DartApiMessagePort, &result);
}

}
