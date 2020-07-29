import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learntech/models/quest.dart';
import 'package:learntech/models/quest_answer.dart';
import 'package:learntech/models/quest_category.dart';
import 'package:learntech/models/quest_level.dart';
import 'package:mobx/mobx.dart';

part 'quest_store.g.dart';

class QuestStore = _QuestStore with _$QuestStore;

abstract class _QuestStore with Store {
  _QuestStore({
    ObservableList<Quest> quests,
    this.filter = VisibilityFilter.all,
  }) : quests = quests ?? ObservableList<_QuestStore>();

  final ObservableList<Quest> quests;
  ReactionDisposer _disposeSaveReaction;

  @observable
  VisibilityFilter filter;

  @observable
  ObservableFuture<void> loader;

  @computed
  List<Quest> get allQuests => quests.toList(growable: false);

  @action
  Future<void> _loadAnswers(Quest quest) {
    Firestore.instance
        .collection('quests')
        .document(quest.id)
        .collection('answers')
        .getDocuments()
        .then((event) {
      if (event.documents.isNotEmpty) {
        List<QuestAnswer> answers = List(0);
        event.documents.forEach((doc) => answers.add(QuestAnswer(
            id: doc.documentID,
            description: doc["description"],
            isRight: doc["isRight"])));

        quests.firstWhere((element) => element.id == quest.id).answers =
            answers;
      }
    }).catchError((e) => print("error fetching data: $e"));
  }

  @action
  Future<void> _loadQuests(QuestCategory category, QuestLevel level) async {
    quests.clear();

    Firestore.instance
        .collection(
            'categories/' + category.id + '/levels/' + level.id + '/quests')
        .getDocuments()
        .then((event) {
      if (event.documents.isNotEmpty) {
        event.documents.forEach((doc) => quests.add(Quest(
            id: doc.documentID,
            description: doc["description"],
            answers: new List(0))));
      }
    }).catchError((e) => print("error fetching data: $e"));
  }

  Future<void> init(QuestCategory category, QuestLevel level) async {
    loader = ObservableFuture(_loadQuests(category, level));

    await loader;
  }

  void dispose() => _disposeSaveReaction();
}

enum VisibilityFilter { all, pending, completed }
