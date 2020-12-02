import 'package:value_tree_sync_codegen/src/template/store.dart';

class ValueTreeSyncedFieldTemplate {
  StoreTemplate storeTemplate;
  String computedName;
  String type;
  String name;
  bool isPrivate;

  @override
  // ignore: prefer_single_quotes
  // $type $name;
  String toString() => """
  @override
  @computed
  $type get $name => state.attributes['$name'];""";
}
