/*
  ==============================================================================

    FlutterIntegration.h
    Created: 15 Mar 2021 10:50:16am
    Author:  Tom Duncalf

  ==============================================================================
*/

#pragma once

class FlutterIntegration
{
public:
    void setupFlutterView (void* nativeView);
    void resize (void* nativeView);
    
private:
    void* flutterViewController;
};
