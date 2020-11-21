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
