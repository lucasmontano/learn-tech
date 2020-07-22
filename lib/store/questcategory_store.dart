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
    final entities = [
      QuestCategory(description: "Dart"),
      QuestCategory(description: "Rust"),
      QuestCategory(description: "VB"),
      QuestCategory(description: "Java"),
      QuestCategory(description: "TypeScript"),
      QuestCategory(description: "JS"),
      QuestCategory(description: "Database"),
    ];

    categories.addAll(entities.toList());
  }

  Future<void> init() async {
    loader = ObservableFuture(_loadCategories());

    await loader;
  }

  void dispose() => _disposeSaveReaction();
}

enum VisibilityFilter { all, pending, completed }
