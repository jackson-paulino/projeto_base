import '../../../domain/errors/errors.dart';

abstract class StorageState {}

class StorageInitialState extends StorageState {}

class StorageLoadingState extends StorageState {}

class StorageSaveUserState extends StorageState {}

class StorageClearUserState extends StorageState {}

class StorageFeatchUserFinishedState implements StorageState {
  StorageFeatchUserFinishedState();
}

class StorageFailureState implements StorageState {
  final IErrorsException errorException;

  StorageFailureState(this.errorException);
}
