// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Edit on EditBase, Store {
  Computed<List<Track>> _$tracksComputed;

  @override
  List<Track> get tracks => (_$tracksComputed ??=
          Computed<List<Track>>(() => super.tracks, name: 'EditBase.tracks'))
      .value;
}

// **************************************************************************
// ValueTreeSyncedGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ValueTreeSyncedEdit on EditBase, ValueTreeSyncedStore {
  @override
  @computed
  String get appVersion => state.attributes['appVersion'];
  @override
  @computed
  String get projectID => state.attributes['projectID'];
  @override
  @computed
  String get lastSignificantChange => state.attributes['lastSignificantChange'];
}
