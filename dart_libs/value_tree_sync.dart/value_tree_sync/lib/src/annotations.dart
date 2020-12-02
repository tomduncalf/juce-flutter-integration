/// Internal class only used for code-generation with `value_tree_sync_codegen`.
///
/// During code-generation, this type is detected to identify a `ValueTreeSynced`
class MakeValueTreeSynced {
  const MakeValueTreeSynced._();
}

/// Declares a class field as ValueTreeSynced
const MakeValueTreeSynced valueTreeSynced = MakeValueTreeSynced._();
