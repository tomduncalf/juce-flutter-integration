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
    FlutterIntegration();
    ~FlutterIntegration();
    
    void setupFlutterView (void* nativeView);
    void resize ();
    
private:
    class Pimpl;
    std::unique_ptr<Pimpl> pimpl;
};
