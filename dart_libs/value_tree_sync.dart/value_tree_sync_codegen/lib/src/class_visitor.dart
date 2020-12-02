import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_tree_sync/value_tree_sync.dart';

class ClassVisitor extends SimpleElementVisitor {}

const _storeMixinChecker = TypeChecker.fromRuntime(ValueTreeSyncedStore);

bool isMixinStoreClass(ClassElement classElement) =>
    classElement.mixins.any(_storeMixinChecker.isExactlyType);
