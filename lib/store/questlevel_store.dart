import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learntech/models/quest_category.dart';
import 'package:learntech/models/quest_level.dart';
import 'package:mobx/mobx.dart';

part 'questlevel_store.g.dart';

class QuestLevelStore = _QuestLevelStore with _$QuestLevelStore;

abstract class _QuestLevelStore with Store {
  _QuestLevelStore({
    ObservableList<QuestLevel> levels,
    this.filter = VisibilityFilter.all,
  }) : levels = levels ?? ObservableList<QuestLevel>();

  final ObservableList<QuestLevel> levels;
  ReactionDisposer _disposeSaveReaction;

  @observable
  VisibilityFilter filter;

  @observable
  ObservableFuture<void> loader;

  @computed
  List<QuestLevel> get allLevels => levels.toList(growable: false);

  // TODO remove this function when implementing multiple levels screen
  @computed
  QuestLevel get basicLevel =>
      levels.firstWhere((element) => element.id == 'basic');

  @action
  Future<void> _loadLevels(QuestCategory category) async {
    levels.clear();

    Firestore.instance
        .collection('categories/' + category.id + '/levels')
        .getDocuments()
        .then((event) {
      if (event.documents.isNotEmpty) {
        event.documents.forEach((doc) => levels.add(
            QuestLevel(id: doc.documentID, description: doc["description"])));
      }
    }).catchError((e) => print("error fetching data: $e"));
  }

  Future<void> init(QuestCategory category) async {
    loader = ObservableFuture(_loadLevels(category));

    await loader;
  }

  void dispose() => _disposeSaveReaction();
}

enum VisibilityFilter { all, pending, completed }
