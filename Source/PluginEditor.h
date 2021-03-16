/*
  ==============================================================================

    This file contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"

//#include <tomduncalf_juce_flutter/FlutterIntegration.h>

//==============================================================================
/**
*/
class JuceFlutterAudioProcessorEditor  : public juce::AudioProcessorEditor,
public juce::Timer
{
public:
    JuceFlutterAudioProcessorEditor (JuceFlutterAudioProcessor&, FlutterIntegration&, juce::Uuid&);
    ~JuceFlutterAudioProcessorEditor() override;

    //==============================================================================
    void paint (juce::Graphics&) override;
    void resized() override;

private:
    // This reference is provided as a quick way for your editor to
    // access the processor object that created it.
    JuceFlutterAudioProcessor& audioProcessor;
    
    FlutterIntegration& flutter;
    
    bool flutterSetupComplete = false;

    juce::Uuid& instanceUuid;

    void timerCallback() override;
    int count = 0;
    
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (JuceFlutterAudioProcessorEditor)
};
