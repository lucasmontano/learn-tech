// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Quest on _Quest, Store {
  final _$descriptionAtom = Atom(name: '_Quest.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$answersAtom = Atom(name: '_Quest.answers');

  @override
  List<QuestAnswer> get answers {
    _$answersAtom.reportRead();
    return super.answers;
  }

  @override
  set answers(List<QuestAnswer> value) {
    _$answersAtom.reportWrite(value, super.answers, () {
      super.answers = value;
    });
  }

  @override
  String toString() {
    return '''
description: ${description},
answers: ${answers}
    ''';
  }
}
