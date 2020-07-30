import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'quest_level.g.dart';

class QuestLevel = _QuestLevel with _$QuestLevel;

abstract class _QuestLevel with Store {
  _QuestLevel({
    String id,
    this.description = '',
  }) : id = id ?? Uuid().v4();

  final String id;

  @observable
  String description;

  @override
  String toString() {
    return '_QuestLevel{id: $id, description: $description}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _QuestLevel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          description == other.description;

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
