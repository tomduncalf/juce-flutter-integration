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

void FlutterIntegration::setup (void* nativeView)
{
    FlutterViewController *flutterViewController = [FlutterViewController new];
    [nativeView addSubview: flutterViewController.view];
    [flutterViewController.view setFrame:[view bounds]];
}
