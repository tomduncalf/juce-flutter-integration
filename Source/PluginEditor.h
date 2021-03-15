/*
  ==============================================================================

    This file contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"

//==============================================================================
/**
*/
class JuceFlutterV2AudioProcessorEditor  : public juce::AudioProcessorEditor
{
public:
    JuceFlutterV2AudioProcessorEditor (JuceFlutterV2AudioProcessor&);
    ~JuceFlutterV2AudioProcessorEditor() override;

    //==============================================================================
    void paint (juce::Graphics&) override;
    void resized() override;

private:
    // This reference is provided as a quick way for your editor to
    // access the processor object that created it.
    JuceFlutterV2AudioProcessor& audioProcessor;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (JuceFlutterV2AudioProcessorEditor)
};
