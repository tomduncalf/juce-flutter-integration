import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:ffi/ffi.dart';

// Based on https://github.com/audiooffler/JucyFluttering/

// typedef void Callback(List<dynamic> x);
typedef void Callback(int x);
var nativeCallbacks = List<Callback>();

// Get a reference to the native part as a DynamicLibrary
final DynamicLibrary nativeLib = Platform.isAndroid
    ? DynamicLibrary.open(
        "libnative_add.so") // this needs to match the app name I guess
    : DynamicLibrary.open(
        "/Users/td/Library/Audio/Plug-Ins/Components/JuceFlutter.component/Contents/MacOS/JuceFlutter");

String instanceId;

// ServicesBinding.defaultBinaryMessenger().setMessageHandler("foo", );

// // Get a reference to a native function so we can call it from Dart
// final int Function(int x, int y) nativeAdd = nativeLib
//     .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
//     .asFunction();

const channel = const MethodChannel('startup');

// Setup the connection between Dart and C++
void initialise() {
  // This is some boilerplate to setup the FFI
  final initializeApi = nativeLib.lookupFunction<
      IntPtr Function(Pointer<Utf8>, Pointer<Void>),
      int Function(Pointer<Utf8>, Pointer<Void>)>("InitializeDartApi");

  final interactiveCppRequests = ReceivePort()
    ..listen((data) {
      print('Received: ${data} from C++');
      nativeCallbacks.forEach((element) {
        element(data);
      });
    });
  final int nativePort = interactiveCppRequests.sendPort.nativePort;

  final void Function(
      Pointer<Utf8> uuid,
      int
          port) setDartApiMessagePort = nativeLib
      .lookup<NativeFunction<Void Function(Pointer<Utf8> uuid, Int64 port)>>(
          "SetDartApiMessagePort")
      .asFunction();

  channel.setMethodCallHandler((call) async {
    print("METHOD CALL " + call.arguments);
    instanceId = call.arguments; // lol

    if (initializeApi(
            instanceId.toNativeUtf8(), NativeApi.initializeApiDLData) !=
        0) {
      throw "Failed to initialize Dart API";
    }

    setDartApiMessagePort(instanceId.toNativeUtf8(), nativePort);
  });
  channel.invokeMethod("startup");

  print("Native integrationnitialised");
}
