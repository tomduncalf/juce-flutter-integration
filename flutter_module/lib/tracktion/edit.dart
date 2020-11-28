import 'package:flutter_module/tracktion/track.dart';
import 'package:flutter_module/tracktion/value_tree_state_node.dart';
import 'package:mobx/mobx.dart';

part 'edit.g.dart';

class Edit = EditBase with _$Edit;

abstract class EditBase with Store {
  EditBase(Observable<ValueTreeStateNode> s) {
    state = s;
  }

  @computed
  String get appVersion {
    return state.value.attributes['appVersion'];
  }

  @computed
  String get projectID {
    return state.value.attributes['projectID'];
  }

  @computed
  String get lastSignificantChange {
    return state.value.attributes['lastSignificantChange'];
  }

  @computed
  List<Track> get tracks {
    return state.value.children
        .where((element) => element.name == 'TRACK')
        .map((t) => Track(Observable(t)))
        .toList();
  }

  Observable<ValueTreeStateNode> state;

  String toString() {
    return '''
appVersion: $appVersion
projectId: $projectID
lastSignificantChange: $lastSignificantChange
tracks: $tracks''';
  }
}
