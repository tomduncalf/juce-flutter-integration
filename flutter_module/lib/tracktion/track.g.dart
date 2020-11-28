// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Track on TrackBase, Store {
  Computed<double> _$midiVPropComputed;

  @override
  double get midiVProp => (_$midiVPropComputed ??=
          Computed<double>(() => super.midiVProp, name: 'TrackBase.midiVProp'))
      .value;
  Computed<double> _$midiVOffsetComputed;

  @override
  double get midiVOffset =>
      (_$midiVOffsetComputed ??= Computed<double>(() => super.midiVOffset,
              name: 'TrackBase.midiVOffset'))
          .value;

  @override
  String toString() {
    return '''
midiVProp: ${midiVProp},
midiVOffset: ${midiVOffset}
    ''';
  }
}
