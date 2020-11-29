import 'package:build/build.dart';
import 'package:value_tree_sync_codegen/value_tree_sync_codegen.dart';
import 'package:source_gen/source_gen.dart';

Builder storeGenerator(BuilderOptions options) => SharedPartBuilder(
    [ValueTreeSyncedGenerator()], 'value_tree_synced_generator');
