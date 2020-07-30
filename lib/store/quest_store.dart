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
  }) : quests = quests ?? ObservableList<Quest>();

  final ObservableList<Quest> quests;
  ReactionDisposer _disposeSaveReaction;

  @observable
  VisibilityFilter filter;

  @observable
  ObservableFuture<void> questLoader;

  @observable
  ObservableFuture<void> answersLoader;

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
  Future<void> _loadQuests(QuestCategory category) async {
    quests.clear();

    // TODO load quests according to current level
    Firestore.instance
        .collection('categories/' + category.id + '/levels/basic/quests')
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

  Future<void> init(QuestCategory category) async {
    questLoader = ObservableFuture(_loadQuests(category));

    await questLoader;
  }

  Future<void> loadAnswers(Quest quest) async {
    answersLoader = ObservableFuture(_loadAnswers(quest));

    await answersLoader;
  }

  void dispose() => _disposeSaveReaction();
}

enum VisibilityFilter { all, pending, completed }
