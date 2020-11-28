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
