// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_tree_state_node.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ValueTreeStateNode on ValueTreeStateNodeBase, Store {
  final _$nameAtom = Atom(name: 'ValueTreeStateNodeBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$attributesAtom = Atom(name: 'ValueTreeStateNodeBase.attributes');

  @override
  ObservableMap<dynamic, dynamic> get attributes {
    _$attributesAtom.reportRead();
    return super.attributes;
  }

  @override
  set attributes(ObservableMap<dynamic, dynamic> value) {
    _$attributesAtom.reportWrite(value, super.attributes, () {
      super.attributes = value;
    });
  }

  final _$childrenAtom = Atom(name: 'ValueTreeStateNodeBase.children');

  @override
  ObservableList<ValueTreeStateNode> get children {
    _$childrenAtom.reportRead();
    return super.children;
  }

  @override
  set children(ObservableList<ValueTreeStateNode> value) {
    _$childrenAtom.reportWrite(value, super.children, () {
      super.children = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
attributes: ${attributes},
children: ${children}
    ''';
  }
}

// **************************************************************************
// ValueTreeSyncedGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic
