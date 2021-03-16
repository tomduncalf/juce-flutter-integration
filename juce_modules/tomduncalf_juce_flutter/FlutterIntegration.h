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
    FlutterIntegration();
    ~FlutterIntegration();
    
    void setupFlutterView (void* nativeView);
    void resize();
    void sendMsgToFlutter (int64_t msg);

private:
    class Pimpl;
    std::unique_ptr<Pimpl> pimpl;
    
//    std
};
