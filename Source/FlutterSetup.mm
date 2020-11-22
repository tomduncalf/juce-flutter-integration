/*
  ==============================================================================

    FlutterSetup.cpp
    Created: 21 Nov 2020 2:52:09pm
    Author:  Tom Duncalf

  ==============================================================================
*/

#include "FlutterSetup.h"
//#include <dart_api_dl.h>

@import UIKit;
@import Flutter;

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
}

// for ios, dart/ffi won't be able to access 'extern "C" functions' without those attributes due to compiler optimizations
#if defined(_WIN32)
#define EXTERN_C extern "C" __declspec(dllexport)
#else
#define EXTERN_C extern "C" __attribute__((visibility("default"))) __attribute__((used))
#endif

EXTERN_C int32_t native_add(int32_t x, int32_t y) {
    return x + y;
};

EXTERN_C int64_t InitializeDartApi(void *data)
{
  return Dart_InitializeApiDL(data);
};
