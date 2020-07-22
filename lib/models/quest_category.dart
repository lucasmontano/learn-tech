import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'quest_category.g.dart';

class QuestCategory = _QuestCategory with _$QuestCategory;

abstract class _QuestCategory with Store {
  _QuestCategory({
    String id,
    this.description = '',
  }) : id = id ?? Uuid().v4();

  final String id;

  @observable
  String description;

  @override
  String toString() {
    return '_QuestCategory{id: $id, description: $description}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _QuestCategory &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          description == other.description;

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
