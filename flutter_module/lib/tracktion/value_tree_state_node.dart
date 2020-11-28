import 'package:mobx/mobx.dart';

part 'value_tree_state_node.g.dart';

class ValueTreeStateNode = ValueTreeStateNodeBase with _$ValueTreeStateNode;

abstract class ValueTreeStateNodeBase with Store {
  @observable
  String name;

  @observable
  ObservableMap attributes = ObservableMap();

  @observable
  ObservableList<ValueTreeStateNode> children = ObservableList();

  @override
  String toString() {
    return '''
name: $name
attributes: $attributes
children: $children
    ''';
  }
}
