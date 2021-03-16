/*
  ==============================================================================

    FlutterIntegration.mm
    Created: 15 Mar 2021 10:50:16am
    Author:  Tom Duncalf

  ==============================================================================
*/

#if JUCE_IOS
 @import Flutter;
#else
 @import FlutterMacOS;
#endif

class FlutterIntegration::Pimpl
{
public:
    void setupFlutterView (void* windowHandle)
    {
    #if JUCE_IOS
        nativeView = (UIView*) windowHandle;
    #else
        nativeView = (NSView*) windowHandle;
    #endif
        
        flutterViewController = [FlutterViewController new];
        // Place the Flutter view below the (transparent) JUCE component view
        // so that we can use the JUCE corner resizer widget
        [nativeView addSubview: flutterViewController.view];
//                                positioned: NSWindowBelow relativeTo: nil];
        [flutterViewController.view setFrame: [nativeView bounds]];
    }

    void resize ()
    {
        // Sometimes this gets called before we are ready
        if (nativeView == nullptr) return;
        
        [flutterViewController.view setFrame: [nativeView bounds]];
    }
    
private:
    FlutterViewController* flutterViewController;
#if JUCE_IOS
    UIView* nativeView;
#else
    NSView* nativeView;
#endif
    
};
