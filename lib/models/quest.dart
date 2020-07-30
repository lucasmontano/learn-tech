import 'package:learntech/models/quest_answer.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'quest.g.dart';

class Quest = _Quest with _$Quest;

abstract class _Quest with Store {
  _Quest({String id, this.description = '', this.answers})
      : id = id ?? Uuid().v4();

  final String id;

  @observable
  String description;

  @observable
  List<QuestAnswer> answers;

  @override
  String toString() {
    return '_Quest{id: $id, description: $description, answers: $answers}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Quest &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          description == other.description;

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
