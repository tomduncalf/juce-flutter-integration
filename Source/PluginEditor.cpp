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
    
    startTimer (5000);
}

JuceFlutterAudioProcessorEditor::~JuceFlutterAudioProcessorEditor()
{
}

//==============================================================================
void JuceFlutterAudioProcessorEditor::paint (juce::Graphics& g)
{
    if (flutterSetupComplete) return;

    flutter.setupFlutterView (getWindowHandle());
    flutterSetupComplete = true;
}

void JuceFlutterAudioProcessorEditor::resized()
{
    // This is generally where you'll want to lay out the positions of any
    // subcomponents in your editor..
    flutter.resize (getWindowHandle());
}

void JuceFlutterAudioProcessorEditor::timerCallback()
{
    setSize (500, 500);
    stopTimer();
}
