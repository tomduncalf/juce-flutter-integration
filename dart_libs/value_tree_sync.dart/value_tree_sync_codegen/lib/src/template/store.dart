import 'package:value_tree_sync_codegen/src/template/comma_list.dart';
import 'package:value_tree_sync_codegen/src/template/params.dart';
import 'package:value_tree_sync_codegen/src/template/rows.dart';
import 'package:value_tree_sync_codegen/src/template/value_tree_synced_field.dart';

class MixinStoreTemplate extends StoreTemplate {
  String get typeName => '_\$$publicTypeName';

  @override
  String toString() => '''
  mixin $typeName$typeParams on $parentTypeName$typeArgs, Store {
    $storeBody
  }''';
}

abstract class StoreTemplate {
  final SurroundedCommaList<TypeParamTemplate> typeParams =
      SurroundedCommaList('<', '>', []);
  final SurroundedCommaList<String> typeArgs =
      SurroundedCommaList('<', '>', []);
  String publicTypeName;
  String parentTypeName;

  final Rows<ValueTreeSyncedFieldTemplate> fields = Rows();
  final List<String> toStringList = [];

  bool generateToString = false;
  // String _actionControllerName;
  // String get actionControllerName =>
  //     _actionControllerName ??= '_\$${parentTypeName}ActionController';

  // String get actionControllerField => actions.isEmpty
  //     ? ''
  //     : "final $actionControllerName = ActionController(name: '$parentTypeName');";

  String get toStringMethod {
    if (!generateToString) {
      return '';
    }

    final publicFieldsList = fields.templates
        .where((element) => !element.isPrivate)
        .map((current) => '${current.name}: \${${current.name}}');

    // final publicComputedsList = computeds.templates
    //     .where((element) => !element.isPrivate)
    //     .map((current) => '${current.name}: \${${current.name}}');

    final allStrings = toStringList..addAll(publicFieldsList);
    // ..addAll(publicComputedsList);

    // The indents have been kept to ensure each field comes on a separate line without any tabs/spaces
    return '''
  @override
  String toString() {
    return \'\'\'
${allStrings.join(',\n')}
    \'\'\';
  }
  ''';
  }

  String get storeBody => '''
  $fields

  $toStringMethod
  ''';
}
