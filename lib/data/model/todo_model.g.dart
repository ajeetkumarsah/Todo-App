// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoModelAdapter extends TypeAdapter<ToDoModel> {
  @override
  final int typeId = 0;

  @override
  ToDoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoModel()
      ..title = fields[0] as String
      ..description = fields[1] as String?
      ..dueDate = fields[2] as DateTime?
      ..isCompleted = fields[3] as bool
      ..createdAt = fields[4] as DateTime?
      ..status = fields[5] as TodoStatus;
  }

  @override
  void write(BinaryWriter writer, ToDoModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.dueDate)
      ..writeByte(3)
      ..write(obj.isCompleted)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TodoStatusAdapter extends TypeAdapter<TodoStatus> {
  @override
  final int typeId = 1;

  @override
  TodoStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TodoStatus.todo;
      case 1:
        return TodoStatus.active;
      case 2:
        return TodoStatus.inProgress;
      case 3:
        return TodoStatus.completed;
      default:
        return TodoStatus.todo;
    }
  }

  @override
  void write(BinaryWriter writer, TodoStatus obj) {
    switch (obj) {
      case TodoStatus.todo:
        writer.writeByte(0);
        break;
      case TodoStatus.active:
        writer.writeByte(1);
        break;
      case TodoStatus.inProgress:
        writer.writeByte(2);
        break;
      case TodoStatus.completed:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
