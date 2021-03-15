/*
  ==============================================================================

    FlutterIntegration.mm
    Created: 15 Mar 2021 10:50:16am
    Author:  Tom Duncalf

  ==============================================================================
*/

#include "FlutterIntegration.h"

#if TARGET_OS_IOS
 @import Flutter;
#else
 @import FlutterMacOS;
#endif

void FlutterIntegration::setupFlutterView (void* windowHandle)
{
#if JUCE_IOS
    UIView *nativeView = (UIView*) windowHandle;
#else
    NSView *nativeView = (NSView*) windowHandle;
#endif
    
    FlutterViewController *flutterViewController = [FlutterViewController new];
    [nativeView addSubview: flutterViewController.view];
    [flutterViewController.view setFrame: [nativeView bounds]];
}
