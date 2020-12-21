/*
  ==============================================================================

    FlutterSetup.h
    Created: 21 Nov 2020 2:52:47pm
    Author:  Tom Duncalf

  ==============================================================================
*/

#pragma once

#include <dart/dart_api_dl.h>

namespace JuceFlutter {

void setupFlutter();
void addFlutterToView (void* view);
void sendMsgToFlutter(int64_t msg);

static void* flutterEngine;

}
