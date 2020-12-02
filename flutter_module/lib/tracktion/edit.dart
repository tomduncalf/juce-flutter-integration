import 'package:flutter_module/tracktion/track.dart';
import 'package:flutter_module/tracktion/value_tree_state_node.dart';
import 'package:value_tree_sync/value_tree_sync.dart';
import 'package:mobx/mobx.dart';

part 'edit.g.dart';

class Edit = EditBase with _$Edit, _$ValueTreeSyncedEdit;

@StoreConfig(hasToString: false)
abstract class EditBase with Store, ValueTreeSyncedStore {
  EditBase(ValueTreeStateNode s) {
    state = s;
  }

  @valueTreeSynced
  String appVersion;

  @valueTreeSynced
  String projectID;

  @valueTreeSynced
  String lastSignificantChange;

  @computed
  List<Track> get tracks {
    return state.children
        .where((element) => element.name == 'TRACK')
        .map((t) => Track(t))
        .toList();
  }

  ValueTreeStateNode state;

  String toString() {
    return '''
appVersion: $appVersion
projectId: $projectID
lastSignificantChange: $lastSignificantChange
tracks: $tracks''';
  }
}
