// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_answer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestAnswer on _QuestAnswer, Store {
  final _$descriptionAtom = Atom(name: '_QuestAnswer.description');

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

  final _$isRightAtom = Atom(name: '_QuestAnswer.isRight');

  @override
  bool get isRight {
    _$isRightAtom.reportRead();
    return super.isRight;
  }

  @override
  set isRight(bool value) {
    _$isRightAtom.reportWrite(value, super.isRight, () {
      super.isRight = value;
    });
  }

  @override
  String toString() {
    return '''
description: ${description},
isRight: ${isRight}
    ''';
  }
}
