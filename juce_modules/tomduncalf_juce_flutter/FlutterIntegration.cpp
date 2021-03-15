/*
  ==============================================================================

    FlutterIntegration.cpp
    Created: 15 Mar 2021 11:22:28am
    Author:  Tom Duncalf

  ==============================================================================
*/

FlutterIntegration::FlutterIntegration() : pimpl (std::make_unique<Pimpl> ()) { }

FlutterIntegration::~FlutterIntegration() = default;

void FlutterIntegration::setupFlutterView (void* nativeView)
{
    pimpl->setupFlutterView (nativeView);
}

void FlutterIntegration::resize()
{
    pimpl->resize();
}
