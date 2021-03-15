/*
  ==============================================================================

    This file contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"

#include "FlutterIntegration/FlutterIntegration.h"

//==============================================================================
/**
*/
class JuceFlutterAudioProcessorEditor  : public juce::AudioProcessorEditor
{
public:
    JuceFlutterAudioProcessorEditor (JuceFlutterAudioProcessor&, FlutterIntegration&);
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

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (JuceFlutterAudioProcessorEditor)
};
