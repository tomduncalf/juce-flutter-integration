/*******************************************************************************
BEGIN_JUCE_MODULE_DECLARATION

ID:               tomduncalf_juce_flutter
vendor:           Tom Duncalf
version:          0.1
name:             JUCE Flutter integration
description:      JUCE Flutter integration
website:          http://www.todo.com/
license:          Copyright. All Rights Reserved.

END_JUCE_MODULE_DECLARATION

*******************************************************************************/

#pragma once

#include "../../JUCE/modules/juce_core/system/juce_TargetPlatform.h"

#if JUCE_ANDROID
 #define JUCE_CORE_INCLUDE_NATIVE_HEADERS 1
 #define JUCE_CORE_INCLUDE_JNI_HELPERS 1
#endif

#if JUCE_IOS || JUCE_MAC
 #define JUCE_CORE_INCLUDE_NATIVE_HEADERS 1
 #define JUCE_CORE_INCLUDE_OBJC_HELPERS 1
#endif

#include "FlutterIntegration.h"

//==============================================================================
