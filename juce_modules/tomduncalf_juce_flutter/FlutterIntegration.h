/*
  ==============================================================================

    FlutterIntegration.h
    Created: 15 Mar 2021 10:50:16am
    Author:  Tom Duncalf

  ==============================================================================
*/

#pragma once

#include "../../libs/dart/dart_api_dl.h"

class FlutterIntegration
{
public:
    // TODO pass uuid by ref or value?
    FlutterIntegration (juce::Uuid u);
    ~FlutterIntegration();
    
    void setupFlutterView (void* nativeView);
    void resize();
    void sendMsgToFlutter (int64_t msg);
    
    void setDartMessagePort (int64_t port);

private:
    class Pimpl;
    std::unique_ptr<Pimpl> pimpl;
    
    juce::Uuid instanceUuid;
    int64_t dartMessagePort;
};
