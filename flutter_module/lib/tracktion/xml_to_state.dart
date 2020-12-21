// import 'dart:io';

import 'package:flutter_module/tracktion/example_xml.dart';
import 'package:flutter_module/tracktion/value_tree_state_node.dart';
import 'package:mobx/mobx.dart';
import 'package:xml/xml.dart';

// final file = new File(
//     '/Users/td/Development/JuceFlutter/JuceFlutter/flutter_module/lib/tracktion.xml');
// final xml = XmlDocument.parse(file.readAsStringSync());
final xml = XmlDocument.parse(exampleXml);

// void testState() {
//   var node = ValueTreeStateNode();
//   node.name = "Test";
//   node.attributes = {'one': 'two', 'number': 4};

//   var node2 = ValueTreeStateNode();
//   node2.name = "Test2";
//   node2.attributes = {'one': 2, 'number': 5};

//   node.children.add(node2);

//   var x = node.attributes['number'];
//   if (x is String) {
//     print("$x is a string");
//   } else if (x is int) {
//     print("$x is a int");
//   }
// }

ValueTreeStateNode convertXmlNode(XmlElement xmlNode) {
  var result = ValueTreeStateNode();
  result.name = xmlNode.name.toString();

  result.attributes = ObservableMap.of(Map.fromIterable(xmlNode.attributes,
      key: (item) => item.name.toString(), value: (item) => item.value));

  result.children = ObservableList.of(xmlNode.children
      .where((e) => e is XmlElement)
      .map((e) => convertXmlNode(e))
      .toList());
  return result;
}

ValueTreeStateNode xmlToState() {
  var state = convertXmlNode(xml.rootElement);
  // print(state);
  return state;
}
