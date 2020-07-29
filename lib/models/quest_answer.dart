import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'quest_answer.g.dart';

class QuestAnswer = _QuestAnswer with _$QuestAnswer;

abstract class _QuestAnswer with Store {
  _QuestAnswer({String id, this.description = '', this.isRight = false})
      : id = id ?? Uuid().v4();

  final String id;

  @observable
  String description;

  @observable
  bool isRight;

  @override
  String toString() {
    return '_QuestAnswer{id: $id, description: $description, isRight: $isRight}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _QuestAnswer &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          isRight == other.isRight &&
          description == other.description;

  @override
  int get hashCode => id.hashCode ^ description.hashCode ^ isRight.hashCode;
}
