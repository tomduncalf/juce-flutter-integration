/*
  ==============================================================================

    FlutterIntegration.mm
    Created: 15 Mar 2021 10:50:16am
    Author:  Tom Duncalf

  ==============================================================================
*/

#include "FlutterIntegration.h"

#if JUCE_IOS
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
    
    flutterViewController = [FlutterViewController new];
    // Place the Flutter view below the (transparent) JUCE component view
    // so that we can use the JUCE corner resizer widget
    [[nativeView superview] addSubview: ((FlutterViewController*) flutterViewController).view
                            positioned: NSWindowBelow relativeTo: nil];
    [((FlutterViewController*) flutterViewController).view setFrame: [nativeView bounds]];
}

void FlutterIntegration::resize (void* windowHandle)
{
    // Sometimes this gets called before we are ready
    if (windowHandle == nullptr) return;
    
#if JUCE_IOS
    UIView *nativeView = (UIView*) windowHandle;
#else
    NSView *nativeView = (NSView*) windowHandle;
#endif
    
    [((FlutterViewController*) flutterViewController).view setFrame: [nativeView bounds]];
}
