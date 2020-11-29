// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Edit on EditBase, Store {
  Computed<String> _$appVersionComputed;

  @override
  String get appVersion => (_$appVersionComputed ??=
          Computed<String>(() => super.appVersion, name: 'EditBase.appVersion'))
      .value;
  Computed<String> _$projectIDComputed;

  @override
  String get projectID => (_$projectIDComputed ??=
          Computed<String>(() => super.projectID, name: 'EditBase.projectID'))
      .value;
  Computed<String> _$lastSignificantChangeComputed;

  @override
  String get lastSignificantChange => (_$lastSignificantChangeComputed ??=
          Computed<String>(() => super.lastSignificantChange,
              name: 'EditBase.lastSignificantChange'))
      .value;
  Computed<List<Track>> _$tracksComputed;

  @override
  List<Track> get tracks => (_$tracksComputed ??=
          Computed<List<Track>>(() => super.tracks, name: 'EditBase.tracks'))
      .value;

  @override
  String toString() {
    return '''
appVersion: ${appVersion},
projectID: ${projectID},
lastSignificantChange: ${lastSignificantChange},
tracks: ${tracks}
    ''';
  }
}

// **************************************************************************
// ValueTreeSyncedGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic
