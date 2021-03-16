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

final processId = Uuid().v4();

// ServicesBinding.defaultBinaryMessenger().setMessageHandler("foo", );

// // Get a reference to a native function so we can call it from Dart
// final int Function(int x, int y) nativeAdd = nativeLib
//     .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
//     .asFunction();

const channel = const MethodChannel('startup');

// Setup the connection between Dart and C++
void initialise() {
  channel.setMethodCallHandler(
      (call) async => print("METHOD CALL " + call.arguments));
  channel.invokeMethod("startup");

  print("nativeLib");
  print(nativeLib);
  print("processId $processId");

  // final lib = DynamicLibrary.process();

  // This is some boilerplate to setup the FFI
  final initializeApi = nativeLib.lookupFunction<
      IntPtr Function(Pointer<Utf8>, Pointer<Void>),
      int Function(Pointer<Utf8>, Pointer<Void>)>("InitializeDartApi");

  if (initializeApi(processId.toNativeUtf8(), NativeApi.initializeApiDLData) !=
      0) {
    throw "Failed to initialize Dart API";
  }

  final interactiveCppRequests = ReceivePort()
    ..listen((data) {
      print('Received: ${data} from C++');
      nativeCallbacks.forEach((element) {
        element(data);
      });
    });
  final int nativePort = interactiveCppRequests.sendPort.nativePort;

  final void Function(int port) setDartApiMessagePort = nativeLib
      .lookup<NativeFunction<Void Function(Int64 port)>>(
          "SetDartApiMessagePort")
      .asFunction();

  setDartApiMessagePort(nativePort);

  print("Native integrationnitialised");
}
