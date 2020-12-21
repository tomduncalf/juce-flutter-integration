import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX
import 'dart:isolate';

// Based on https://github.com/audiooffler/JucyFluttering/

typedef void Callback(List<dynamic> x);
var nativeCallbacks = List<Callback>();

// Get a reference to the native part as a DynamicLibrary
final DynamicLibrary nativeLib = Platform.isAndroid
    ? DynamicLibrary.open(
        "libnative_add.so") // this needs to match the app name I guess
    : DynamicLibrary.process();

// Get a reference to a native function so we can call it from Dart
final int Function(int x, int y) nativeAdd = nativeLib
    .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
    .asFunction();

// Setup the connection between Dart and C++
void initialiseNativeIntegration() {
  final lib = DynamicLibrary.process();

  // This is some boilerplate to setup the FFI
  final initializeApi = lib.lookupFunction<IntPtr Function(Pointer<Void>),
      int Function(Pointer<Void>)>("InitializeDartApi");

  if (initializeApi(NativeApi.initializeApiDLData) != 0) {
    throw "Failed to initialize Dart API";
  }

  final interactiveCppRequests = ReceivePort()
    ..listen((data) {
      // print('Received: ${data} from C++');
      nativeCallbacks.forEach((element) {
        element(data);
      });
    });
  final int nativePort = interactiveCppRequests.sendPort.nativePort;

  final void Function(int port) setDartApiMessagePort = lib
      .lookup<NativeFunction<Void Function(Int64 port)>>(
          "SetDartApiMessagePort")
      .asFunction();

  setDartApiMessagePort(nativePort);

  print("Native integrationnitialised");
}
