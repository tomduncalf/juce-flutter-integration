import 'dart:io';

import 'package:xml/xml.dart';

final file = new File(
    '/Users/td/Development/JuceFlutter/JuceFlutter/flutter_module/lib/tracktion.xml');
final xml = XmlDocument.parse(file.readAsStringSync());

class ValueTreeStateNode {
  String name;
  Map attributes = Map();
  List<ValueTreeStateNode> children = List();

  @override
  String toString() {
    return '''
name: $name
attributes: $attributes
children: $children
    ''';
  }
}

void testState() {
  var node = ValueTreeStateNode();
  node.name = "Test";
  node.attributes = {'one': 'two', 'number': 4};

  var node2 = ValueTreeStateNode();
  node2.name = "Test2";
  node2.attributes = {'one': 2, 'number': 5};

  node.children.add(node2);

  var x = node.attributes['number'];
  if (x is String) {
    print("$x is a string");
  } else if (x is int) {
    print("$x is a int");
  }
}

ValueTreeStateNode convertXmlNode(XmlElement xmlNode) {
  var result = ValueTreeStateNode();
  result.name = xmlNode.name.toString();
  result.attributes = xmlNode.attributes.asMap();
  result.children = xmlNode.children
      .where((e) => e is XmlElement)
      .map((e) => convertXmlNode(e))
      .toList();
  return result;
}

ValueTreeStateNode xmlToState() {
  var state = convertXmlNode(xml.rootElement);
  print(state);
  return state;
}
