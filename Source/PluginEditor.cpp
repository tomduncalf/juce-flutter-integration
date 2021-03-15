/*
  ==============================================================================

    This file contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"

//==============================================================================
JuceFlutterAudioProcessorEditor::JuceFlutterAudioProcessorEditor (JuceFlutterAudioProcessor& p, FlutterIntegration& f)
    : AudioProcessorEditor (&p), audioProcessor (p), flutter (f)
{
    // Make sure that before the constructor has finished, you've set the
    // editor's size to whatever you need it to be.
    setSize (400, 300);
    setResizeLimits (100, 100, 1000, 1000);
    setResizable (true, true);
}

JuceFlutterAudioProcessorEditor::~JuceFlutterAudioProcessorEditor()
{
}

//==============================================================================
void JuceFlutterAudioProcessorEditor::paint (juce::Graphics& g)
{
    g.fillAll (juce::Colours::transparentWhite);

    if (flutterSetupComplete) return;

    flutter.setupFlutterView (getWindowHandle());
    flutterSetupComplete = true;
}

void JuceFlutterAudioProcessorEditor::resized()
{
    flutter.resize (getWindowHandle());
}

void JuceFlutterAudioProcessorEditor::timerCallback()
{
    setSize (500, 500);
    stopTimer();
}
