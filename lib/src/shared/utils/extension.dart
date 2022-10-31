import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/event_repository.dart';
import '../../data/repositories/storage_repository.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/auth_user_usecase.dart';
import '../../domain/usecases/clear_user_storage_usecase.dart';
import '../../domain/usecases/featch_events_usecase.dart';
import '../../domain/usecases/featch_pdv_dates_usecase.dart';
import '../../domain/usecases/featch_pdvs_usecase.dart';
import '../../domain/usecases/featch_sales_dates_usecase.dart';
import '../../domain/usecases/featch_sales_pdv_usecase.dart';
import '../../domain/usecases/featch_ticket_lotes_usecase.dart';
import '../../domain/usecases/featch_ticket_sales_usecase.dart';
import '../../domain/usecases/featch_user_storage_usecase.dart';
import '../../domain/usecases/featch_withdraw_pdv_usecase.dart';
import '../../domain/usecases/save_user_storage_usecase.dart';
import '../../external/datasources/auth_datasource.dart';
import '../../external/datasources/clear_user_storage_datasource.dart';
import '../../external/datasources/featch_events_datasource.dart';
import '../../external/datasources/featch_pdv_dates_datasource.dart';
import '../../external/datasources/featch_pdvs_datasource.dart';
import '../../external/datasources/featch_sales_dates_datasource.dart';
import '../../external/datasources/featch_sales_pdv_datasource.dart';
import '../../external/datasources/featch_ticket_lotes_datasource.dart';
import '../../external/datasources/featch_ticket_sales_datasource.dart';
import '../../external/datasources/featch_user_storage_datasource.dart';
import '../../external/datasources/featch_withdraw_pdv_datasource.dart';
import '../../external/datasources/save_user_storage_datasource.dart';
import '../../external/infrastructure/http_adapter.dart';
import '../../external/secure_storage/secure_storage.dart';
import '../../presentation/bloc/home/home_bloc.dart';
import '../../presentation/bloc/home/home_event.dart';
import '../../presentation/bloc/pdvs/pdvs_bloc.dart';
import '../../presentation/bloc/pdvs/pdvs_event.dart';
import '../../presentation/bloc/splash/splash_bloc.dart';
import '../../presentation/bloc/storage/storage_bloc.dart';

extension BuildContextX on BuildContext {
  HttpAdapter httpAdapter() {
    return read<HttpAdapter>();
  }

  String token() {
    final user = read<User>();
    return user.token;
  }

  User user() {
    return read<User>();
  }

  void addUser(User user) {
    read<User>().name = user.name;
    read<User>().token = user.token;
    read<User>().role = user.role;
  }

  void clearUser() {
    read<User>().name = '';
    read<User>().token = '';
    read<User>().role = '';
  }

  FeatchPdvDatesUsecase pdvDatesUsecase() {
    return read<FeatchPdvDatesUsecase>();
  }

  void pdvsBlocAdd(String eventId) {
    return read<PdvsBloc>().add(FeatchPdvsEvent(eventId));
  }

  void homeBlocAdd(bool eventWon) {
    return read<HomeBloc>().add(FeatchEventsEvent(eventWon: eventWon));
  }

  StorageBloc storageBloc() {
    return read<StorageBloc>();
  }

  HomeBloc homeBloc() {
    return read<HomeBloc>();
  }

  PdvsBloc pdvsBloc() {
    return read<PdvsBloc>();
  }

  FeatchSalesDatesUsecase salesDatesUsecase() {
    return read<FeatchSalesDatesUsecase>();
  }

  FeatchSalesPdvUsecase salesPdvUsecase() {
    return read<FeatchSalesPdvUsecase>();
  }

  SplashBloc splashBloc() {
    return read<SplashBloc>();
  }

  FeatchTicketLotesUsecase ticketLotesUsecase() {
    return read<FeatchTicketLotesUsecase>();
  }

  FeatchTicketSalesUsecase ticketSalesUsecase() {
    return read<FeatchTicketSalesUsecase>();
  }

  FeatchWithdrawPdvUsecase withdrawPdvUsecase() {
    return read<FeatchWithdrawPdvUsecase>();
  }

  AuthUserUsecase authUserUsecase() {
    return read<AuthUserUsecase>();
  }

  AuthDatasource authDatasource() {
    return read<AuthDatasource>();
  }

  AuthRepository authRepository() {
    return read<AuthRepository>();
  }

  SecureStorage secureStorage() {
    return read<SecureStorage>();
  }

  SaveUserStorageDatasource saveUserStorageDatasource() {
    return read<SaveUserStorageDatasource>();
  }

  FeatchUserStorageDatasource featchUserStorageDatasource() {
    return read<FeatchUserStorageDatasource>();
  }

  ClearUserStorageDatasource clearUserStorageDatasource() {
    return read<ClearUserStorageDatasource>();
  }

  StorageRepository storageRepository() {
    return read<StorageRepository>();
  }

  FeatchEventsDatasource featchEventsDatasource() {
    return read<FeatchEventsDatasource>();
  }

  FeatchTicketSalesDatasource featchTicketSalesDatasource() {
    return read<FeatchTicketSalesDatasource>();
  }

  FeatchSalesPdvDatasource featchSalesPdvDatasource() {
    return read<FeatchSalesPdvDatasource>();
  }

  FeatchSalesDatesDatasource featchSalesDatesDatasource() {
    return read<FeatchSalesDatesDatasource>();
  }

  FeatchWithdrawPdvDatasource featchWithdrawPdvDatasource() {
    return read<FeatchWithdrawPdvDatasource>();
  }

  FeatchPdvsDatasource featchPdvsDatasource() {
    return read<FeatchPdvsDatasource>();
  }

  FeatchTicketLotesDatasource featchTicketLotesDatasource() {
    return read<FeatchTicketLotesDatasource>();
  }

  FeatchPdvDatesDatasource featchPdvDatesDatasource() {
    return read<FeatchPdvDatesDatasource>();
  }

  EventRepository eventRepository() {
    return read<EventRepository>();
  }

  SaveUserStorageUsecase saveUserStorageUsecase() {
    return read<SaveUserStorageUsecase>();
  }

  FeatchUserStorageUsecase featchUserStorageUsecase() {
    return read<FeatchUserStorageUsecase>();
  }

  ClearUserStorageUsecase clearUserStorageUsecase() {
    return read<ClearUserStorageUsecase>();
  }

  FeatchEventsUsecase featchEventsUsecase() {
    return read<FeatchEventsUsecase>();
  }

  FeatchPdvsUsecase featchPdvsUsecase() {
    return read<FeatchPdvsUsecase>();
  }
}
