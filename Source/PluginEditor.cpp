/*
  ==============================================================================

    This file contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"

#include <juce_audio_plugin_client/Standalone/juce_StandaloneFilterWindow.h>

//==============================================================================
JuceFlutterAudioProcessorEditor::JuceFlutterAudioProcessorEditor (JuceFlutterAudioProcessor& p, FlutterIntegration& f)
    : AudioProcessorEditor (&p), audioProcessor (p), flutter (f)
{
    // To use this in standalone plugin build, change line 82 of juce_StandaloneFilterApp.cpp
    // from `LookAndFeel::getDefaultLookAndFeel().findColour (ResizableWindow::backgroundColourId),`
    // to `juce::Colours::transparentWhite,`, so that we can see the Flutter UI under the JUCE UI.
    // TODO Maybe there is a better way to achieve this!
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
    if (flutterSetupComplete) return;

    flutter.setupFlutterView (getWindowHandle());
    flutterSetupComplete = true;
    
    startTimerHz (1);
}

void JuceFlutterAudioProcessorEditor::resized()
{
    flutter.resize();
}

void JuceFlutterAudioProcessorEditor::timerCallback()
{
    flutter.sendMsgToFlutter (count);
    count++;
}
