import 'package:flutter_module/tracktion/value_tree_state_node.dart';
import 'package:mobx/mobx.dart';

part 'track.g.dart';

class Track = TrackBase with _$Track;

abstract class TrackBase with Store {
  TrackBase(ValueTreeStateNode s) {
    state = s;
  }

  @computed
  double get midiVProp {
    return double.parse(state.attributes['midiVProp']);
  }

  @computed
  double get midiVOffset {
    return double.parse(state.attributes['midiVOffset']);
  }

  ValueTreeStateNode state;

  String toString() {
    return '''
midiVProp: $midiVProp
midiVOffset: $midiVOffset''';
  }
}
