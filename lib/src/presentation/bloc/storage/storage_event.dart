import '../../../domain/entities/user.dart';

abstract class StorageEvent {}

class SubmitUserStorageEvent implements StorageEvent {
  final User user;

  SubmitUserStorageEvent(this.user);
}

class FeatchUserStorageEvent implements StorageEvent {}

class ClearUserStorageEvent implements StorageEvent {}
