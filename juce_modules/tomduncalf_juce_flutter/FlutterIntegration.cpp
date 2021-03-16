/*
  ==============================================================================

    FlutterIntegration.cpp
    Created: 15 Mar 2021 11:22:28am
    Author:  Tom Duncalf

  ==============================================================================
*/

// for ios, dart/ffi won't be able to access 'extern "C" functions' without those attributes due to compiler optimizations
#if defined(_WIN32)
#define EXTERN_C extern "C" __declspec(dllexport)
#else
#define EXTERN_C extern "C" __attribute__((visibility("default"))) __attribute__((used))
#endif

// TODO smart ptr
static std::map<juce::String, FlutterIntegration*> flutterInstances;

// Register the Dart API message part with C++
EXTERN_C void SetDartApiMessagePort(char* uuid, int64_t port)
{
    auto uuidString = juce::String (uuid);
    DBG ("UUID STRING " + uuidString);
    auto& instance = flutterInstances[uuidString];
    instance->setDartMessagePort (port);
};

// Initialise the Dart FFI API
// DL indicates it is the dynamically linked version: https://github.com/mraleph/go_dart_ffi_example/blob/94f367bedce7bef4f67c8175b70a351ca6a04e04/dart_api_dl/include/dart_api_dl.h
EXTERN_C int64_t InitializeDartApi(char* str, void* data)
{
    DBG ("Dart process ID: " << juce::String (str));
    return Dart_InitializeApiDL(data);
};

FlutterIntegration::FlutterIntegration (juce::Uuid u) : pimpl (std::make_unique<Pimpl> ()), instanceUuid (u)
{
    DBG("FlutterIntegration UUID " + u.toString());
    flutterInstances[u.toString()] = this;
}

FlutterIntegration::~FlutterIntegration() = default;

void FlutterIntegration::setupFlutterView (void* nativeView)
{
    pimpl->setupFlutterView (nativeView, instanceUuid.toString().toStdString());
}

void FlutterIntegration::resize()
{
    pimpl->resize();
}

void FlutterIntegration::sendMsgToFlutter (int64_t msg)
{
    if (dartMessagePort == -1)
        return;
    
    Dart_CObject obj;
    obj.type = Dart_CObject_kInt64;
    obj.value.as_int64 = msg;
    Dart_PostCObject_DL (dartMessagePort, &obj);
}

void FlutterIntegration::setDartMessagePort (int64_t port)
{
    dartMessagePort = port;
}
