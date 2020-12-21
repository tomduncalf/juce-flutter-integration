import 'package:flutter/material.dart';
import 'package:flutter_module/painter.dart';

import 'native_integration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<double> points = [0];

  @override
  void initState() {
    super.initState();

    initialiseNativeIntegration();

    // Example calling into C++ from Flutter
    nativeAdd(1, 2);

    // Register a callback to be called when we receive a message from C++, in this
    // case updating our app's state with the values. In our JUCE/React Native integration,
    // we don't do much of this manually as we store all the state in a ValueTree which
    // is then synchronised automatically with a Javascript representation of it... so I'm
    // looking at doing something similar here, its much less error prone than manual state syncing
    nativeCallbacks.add((value) {
      setState(() {
        points = value.cast<double>();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawing Paths',
      home: Container(
        color: Colors.white,
        child: CustomPaint(painter: Painter(points)),
      ),
    );
  }
}
