import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_base/src/shared/utils/extension.dart';

import '../../../domain/usecases/clear_user_storage_usecase.dart';
import '../../../domain/usecases/featch_user_storage_usecase.dart';
import '../../../domain/usecases/save_user_storage_usecase.dart';
import 'storage_event.dart';
import 'storage_state.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  final ISaveUserStorageUsecase saveUserStorage;
  final IFeatchUserStorageUsecase featchUserStorage;
  final IClearUserStorageUsecase clearhUserStorage;
  final BuildContext context;

  StorageBloc(this.saveUserStorage, this.featchUserStorage, this.clearhUserStorage, this.context)
      : super(StorageInitialState()) {
    on<SubmitUserStorageEvent>(_onSaveUserStorage);
    on<FeatchUserStorageEvent>(_onFeatchUserStorage);
    on<ClearUserStorageEvent>(_onClearUserStorage);
  }

  void _onSaveUserStorage(
    SubmitUserStorageEvent event,
    Emitter<StorageState> emitter,
  ) async {
    emitter(StorageLoadingState());

    final result = await saveUserStorage(event.user);

    result.fold(
      (l) => emitter(StorageFailureState(l)),
      (r) => emitter(StorageSaveUserState()),
    );
  }

  void _onFeatchUserStorage(
    FeatchUserStorageEvent event,
    Emitter<StorageState> emitter,
  ) async {
    final result = await featchUserStorage();

    result.fold(
      (l) => emitter(StorageFailureState(l)),
      (r) {
        if (r != null) context.addUser(r);
        emitter(StorageFeatchUserFinishedState());
      },
    );
  }

  void _onClearUserStorage(
    ClearUserStorageEvent event,
    Emitter<StorageState> emitter,
  ) async {
    emitter(StorageLoadingState());

    final result = await clearhUserStorage();

    result.fold(
      (l) => emitter(StorageFailureState(l)),
      (r) {
        context.clearUser();
        emitter(StorageClearUserState());
      },
    );
  }
}
