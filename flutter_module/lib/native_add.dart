import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX
import 'dart:isolate';

typedef void Callback(int x);
var callbacks = List<Callback>();

final DynamicLibrary nativeAddLib = Platform.isAndroid
    ? DynamicLibrary.open("libnative_add.so")
    : DynamicLibrary.process();

final int Function(int x, int y) nativeAdd = nativeAddLib
    .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
    .asFunction();

void initialise() {
  print("initialise");

  final lib = DynamicLibrary.process();
  final initializeApi = lib.lookupFunction<IntPtr Function(Pointer<Void>),
      int Function(Pointer<Void>)>("InitializeDartApi");

  if (initializeApi(NativeApi.initializeApiDLData) != 0) {
    throw "Failed to initialize Dart API";
  }

  final interactiveCppRequests = ReceivePort()
    ..listen((data) {
      print('Received: ${data} from Go');
      callbacks.forEach((element) {
        element(data);
      });
    });
  final int nativePort = interactiveCppRequests.sendPort.nativePort;

  final void Function(int port) setDartApiMessagePort = lib
      .lookup<NativeFunction<Void Function(Int64 port)>>(
          "SetDartApiMessagePort")
      .asFunction();
  setDartApiMessagePort(nativePort);

  print("initialised");
}
