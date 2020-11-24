/*
  ==============================================================================

    FlutterSetup.cpp
    Created: 21 Nov 2020 2:52:09pm
    Author:  Tom Duncalf

  ==============================================================================
*/

#include "FlutterSetup.h"

@import UIKit;
@import Flutter;


// for ios, dart/ffi won't be able to access 'extern "C" functions' without those attributes due to compiler optimizations
#if defined(_WIN32)
#define EXTERN_C extern "C" __declspec(dllexport)
#else
#define EXTERN_C extern "C" __attribute__((visibility("default"))) __attribute__((used))
#endif

EXTERN_C int32_t native_add(int32_t x, int32_t y) {
    return x + y;
};

static int64_t DartApiMessagePort = -1;

EXTERN_C void SetDartApiMessagePort(int64_t port)
{
  DartApiMessagePort = port;
};

EXTERN_C int64_t InitializeDartApi(void *data)
{
  return Dart_InitializeApiDL(data);
};



//@interface Flutter : NSObject
//@property (nonatomic,strong) FlutterEngine *flutterEngine;
//@end

namespace JuceFlutter {

void setupFlutter()
{
    flutterEngine = [[FlutterEngine alloc] initWithName:@"my flutter engine"];
    [flutterEngine run];
}

void addFlutterToView (void* view)
{
    FlutterViewController *flutterViewController =
            [[FlutterViewController alloc] initWithEngine:(FlutterEngine*)flutterEngine nibName:nil bundle:nil];
    [view addSubview: flutterViewController.view];
//    [flutterViewController.view setBackgroundColor:[NSColor windowBackgroundColor]];
    [flutterViewController.view setFrame:[view bounds]];
//    [flutterViewController.view setAutoresizingMask:(NSViewMinXMargin | NSViewMinXMargin | NSViewMinYMargin | NSViewMaxYMargin | NSViewWidthSizable | NSViewHeightSizable)];
}

// this will send long integer to dart receiver port as a message
void sendMsgToFlutter(int64_t msg)
{
  if (DartApiMessagePort == -1)
    return;
  Dart_CObject obj;
  obj.type = Dart_CObject_kInt64;
  obj.value.as_int64 = msg;
  Dart_PostCObject_DL(DartApiMessagePort, &obj);
}

}
