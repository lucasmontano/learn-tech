import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learntech/models/quest_category.dart';
import 'package:mobx/mobx.dart';

part 'questcategory_store.g.dart';

class QuestCategoryStore = _QuestCategoryStore with _$QuestCategoryStore;

abstract class _QuestCategoryStore with Store {
  _QuestCategoryStore({
    ObservableList<QuestCategory> categories,
    this.filter = VisibilityFilter.all,
  }) : categories = categories ?? ObservableList<QuestCategory>();

  final ObservableList<QuestCategory> categories;
  ReactionDisposer _disposeSaveReaction;

  @observable
  VisibilityFilter filter;

  @observable
  ObservableFuture<void> loader;

  @computed
  List<QuestCategory> get allCategories => categories.toList(growable: false);

  @action
  Future<void> _loadCategories() async {
    categories.clear();

    Firestore.instance.collection('categories').getDocuments().then((event) {
      if (event.documents.isNotEmpty) {
        event.documents.forEach((doc) => categories.add(QuestCategory(
            id: doc.documentID, description: doc["description"])));
      }
    }).catchError((e) => print("error fetching data: $e"));
  }

  Future<void> init() async {
    loader = ObservableFuture(_loadCategories());

    await loader;
  }

  void dispose() => _disposeSaveReaction();
}

enum VisibilityFilter { all, pending, completed }
