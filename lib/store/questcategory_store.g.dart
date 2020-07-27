// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questcategory_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestCategoryStore on _QuestCategoryStore, Store {
  Computed<List<QuestCategory>> _$allCategoriesComputed;

  @override
  List<QuestCategory> get allCategories => (_$allCategoriesComputed ??=
          Computed<List<QuestCategory>>(() => super.allCategories,
              name: '_QuestCategoryStore.allCategories'))
      .value;

  final _$filterAtom = Atom(name: '_QuestCategoryStore.filter');

  @override
  VisibilityFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(VisibilityFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$loaderAtom = Atom(name: '_QuestCategoryStore.loader');

  @override
  ObservableFuture<void> get loader {
    _$loaderAtom.reportRead();
    return super.loader;
  }

  @override
  set loader(ObservableFuture<void> value) {
    _$loaderAtom.reportWrite(value, super.loader, () {
      super.loader = value;
    });
  }

  final _$_loadCategoriesAsyncAction =
      AsyncAction('_QuestCategoryStore._loadCategories');

  @override
  Future<void> _loadCategories() {
    return _$_loadCategoriesAsyncAction.run(() => super._loadCategories());
  }

  @override
  String toString() {
    return '''
filter: ${filter},
loader: ${loader},
allCategories: ${allCategories}
    ''';
  }
}
