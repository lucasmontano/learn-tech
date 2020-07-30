// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestStore on _QuestStore, Store {
  Computed<List<Quest>> _$allQuestsComputed;

  @override
  List<Quest> get allQuests =>
      (_$allQuestsComputed ??= Computed<List<Quest>>(() => super.allQuests,
              name: '_QuestStore.allQuests'))
          .value;

  final _$filterAtom = Atom(name: '_QuestStore.filter');

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

  final _$questLoaderAtom = Atom(name: '_QuestStore.questLoader');

  @override
  ObservableFuture<void> get questLoader {
    _$questLoaderAtom.reportRead();
    return super.questLoader;
  }

  @override
  set questLoader(ObservableFuture<void> value) {
    _$questLoaderAtom.reportWrite(value, super.questLoader, () {
      super.questLoader = value;
    });
  }

  final _$answersLoaderAtom = Atom(name: '_QuestStore.answersLoader');

  @override
  ObservableFuture<void> get answersLoader {
    _$answersLoaderAtom.reportRead();
    return super.answersLoader;
  }

  @override
  set answersLoader(ObservableFuture<void> value) {
    _$answersLoaderAtom.reportWrite(value, super.answersLoader, () {
      super.answersLoader = value;
    });
  }

  final _$_loadQuestsAsyncAction = AsyncAction('_QuestStore._loadQuests');

  @override
  Future<void> _loadQuests(QuestCategory category) {
    return _$_loadQuestsAsyncAction.run(() => super._loadQuests(category));
  }

  final _$_QuestStoreActionController = ActionController(name: '_QuestStore');

  @override
  Future<void> _loadAnswers(QuestCategory category, Quest quest) {
    final _$actionInfo = _$_QuestStoreActionController.startAction(
        name: '_QuestStore._loadAnswers');
    try {
      return super._loadAnswers(category, quest);
    } finally {
      _$_QuestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filter: ${filter},
questLoader: ${questLoader},
answersLoader: ${answersLoader},
allQuests: ${allQuests}
    ''';
  }
}
