/*
  ==============================================================================

    This file contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"

#include "FlutterSetup.h"

@import UIKit;
@import Flutter;

//==============================================================================
JuceFlutterAudioProcessorEditor::JuceFlutterAudioProcessorEditor (JuceFlutterAudioProcessor& p)
    : AudioProcessorEditor (&p), audioProcessor (p)
{
    // Make sure that before the constructor has finished, you've set the
    // editor's size to whatever you need it to be.
    setSize (400, 300);
    
    // Start a timer to wait for our native view to be ready so that we can init Flutter,
    // there must be a better way to do this  ithout a timer :)
    startTimerHz (10);
}

JuceFlutterAudioProcessorEditor::~JuceFlutterAudioProcessorEditor()
{
}

//==============================================================================
void JuceFlutterAudioProcessorEditor::paint (juce::Graphics& g)
{
    // (Our component is opaque, so we must completely fill the background with a solid colour)
    g.fillAll (getLookAndFeel().findColour (juce::ResizableWindow::backgroundColourId));

    g.setColour (juce::Colours::white);
    g.setFont (15.0f);
    g.drawFittedText ("Hello World!", getLocalBounds(), juce::Justification::centred, 1);
}

void JuceFlutterAudioProcessorEditor::resized()
{
    // This is generally where you'll want to lay out the positions of any
    // subcomponents in your editor..
}

void JuceFlutterAudioProcessorEditor::timerCallback()
{
    UIView *view = (UIView*)getWindowHandle();
    if (view == nullptr) return;
    
    JuceFlutter::addFlutterToView (view);

    stopTimer();
    setupComplete = true;
}
