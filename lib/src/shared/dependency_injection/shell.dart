import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/entities/user.dart';
import '../../shared/utils/extension.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/event_repository.dart';
import '../../data/repositories/storage_repository.dart';
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
import '../../presentation/bloc/pdvs/pdvs_bloc.dart';
import '../../presentation/bloc/splash/splash_bloc.dart';
import '../../presentation/bloc/storage/storage_bloc.dart';

// ignore: must_be_immutable
class Shell extends StatelessWidget {
  final Widget child;
  Shell({Key? key, required this.child}) : super(key: key);

  static bool envDev = false;

  static String urlDev = 'https://dev-api.herokuapp.com';
  static String urlProd = 'https://api.projetobase.com.br';

  static final HttpAdapter httpAdapter = HttpAdapter(
    baseUrl: envDev ? urlDev : urlProd,
    showLog: true,
  );

  User user = User(token: '', name: '');

  static const FlutterSecureStorage storage = FlutterSecureStorage();

  List<RepositoryProvider> get listRepositoryProvider => [
        RepositoryProvider<User>(create: (context) => user),
        //login usecase injection
        RepositoryProvider<AuthDatasource>(
          create: (context) => AuthDatasource(httpAdapter),
        ),
        RepositoryProvider<AuthRepository>(create: (context) {
          final datasource = context.authDatasource();
          return AuthRepository(datasource);
        }),
        RepositoryProvider<AuthUserUsecase>(create: (context) {
          final repository = context.authRepository();
          return AuthUserUsecase(repository);
        }),

        //storage savestorage usecase  feach usecase injection
        RepositoryProvider<SecureStorage>(
          create: (context) => SecureStorage(storage),
        ),
        RepositoryProvider<SaveUserStorageDatasource>(create: (context) {
          final secureStorage = context.secureStorage();
          return SaveUserStorageDatasource(secureStorage);
        }),
        RepositoryProvider<FeatchUserStorageDatasource>(create: (context) {
          final secureStorage = context.secureStorage();
          return FeatchUserStorageDatasource(secureStorage);
        }),
        RepositoryProvider<ClearUserStorageDatasource>(create: (context) {
          final secureStorage = context.secureStorage();
          return ClearUserStorageDatasource(secureStorage);
        }),
        RepositoryProvider<StorageRepository>(create: (context) {
          final saveUserStorage = context.saveUserStorageDatasource();
          final featchUserStorage = context.featchUserStorageDatasource();
          final clearUserStorage = context.clearUserStorageDatasource();
          return StorageRepository(saveUserStorage, featchUserStorage, clearUserStorage);
        }),
        RepositoryProvider<SaveUserStorageUsecase>(create: (context) {
          final repository = context.storageRepository();
          return SaveUserStorageUsecase(repository);
        }),
        RepositoryProvider<FeatchUserStorageUsecase>(create: (context) {
          final repository = context.storageRepository();
          return FeatchUserStorageUsecase(repository);
        }),
        RepositoryProvider<ClearUserStorageUsecase>(create: (context) {
          final repository = context.storageRepository();
          return ClearUserStorageUsecase(repository);
        }),

        //Home usecase injection
        RepositoryProvider<FeatchEventsDatasource>(
            create: (context) => FeatchEventsDatasource(httpAdapter, context)),
        RepositoryProvider<FeatchTicketSalesDatasource>(
          create: (context) => FeatchTicketSalesDatasource(httpAdapter, context),
        ),
        RepositoryProvider<FeatchSalesPdvDatasource>(
          create: (context) => FeatchSalesPdvDatasource(httpAdapter, context),
        ),
        RepositoryProvider<FeatchSalesDatesDatasource>(
          create: (context) => FeatchSalesDatesDatasource(httpAdapter, context),
        ),
        RepositoryProvider<FeatchWithdrawPdvDatasource>(
          create: (context) => FeatchWithdrawPdvDatasource(httpAdapter, context),
        ),
        RepositoryProvider<FeatchPdvsDatasource>(
          create: (context) => FeatchPdvsDatasource(httpAdapter, context),
        ),
        RepositoryProvider<FeatchTicketLotesDatasource>(
          create: (context) => FeatchTicketLotesDatasource(httpAdapter, context),
        ),
        RepositoryProvider<FeatchPdvDatesDatasource>(
          create: (context) => FeatchPdvDatesDatasource(httpAdapter, context),
        ),

        RepositoryProvider<EventRepository>(create: (context) {
          final featchEvents = context.featchEventsDatasource();
          final featchTicketSales = context.featchTicketSalesDatasource();
          final featchSalesPdv = context.featchSalesPdvDatasource();
          final featchSalesDate = context.featchSalesDatesDatasource();
          final featchWithdrawPdv = context.featchWithdrawPdvDatasource();
          final featchPdvs = context.featchPdvsDatasource();
          final featchTicketlotes = context.featchTicketLotesDatasource();
          final pdvDates = context.featchPdvDatesDatasource();
          return EventRepository(featchEvents, featchTicketSales, featchSalesPdv, featchSalesDate,
              featchWithdrawPdv, featchPdvs, featchTicketlotes, pdvDates);
        }),
        RepositoryProvider<FeatchEventsUsecase>(create: (context) {
          final repository = context.eventRepository();
          return FeatchEventsUsecase(repository);
        }),

        RepositoryProvider<FeatchTicketSalesUsecase>(create: (context) {
          final repository = context.eventRepository();
          return FeatchTicketSalesUsecase(repository);
        }),

        RepositoryProvider<FeatchSalesPdvUsecase>(create: (context) {
          final repository = context.eventRepository();
          return FeatchSalesPdvUsecase(repository);
        }),

        RepositoryProvider<FeatchSalesDatesUsecase>(create: (context) {
          final repository = context.eventRepository();
          return FeatchSalesDatesUsecase(repository);
        }),

        RepositoryProvider<FeatchWithdrawPdvUsecase>(create: (context) {
          final repository = context.eventRepository();
          return FeatchWithdrawPdvUsecase(repository);
        }),

        RepositoryProvider<FeatchPdvsUsecase>(create: (context) {
          final repository = context.eventRepository();
          return FeatchPdvsUsecase(repository);
        }),

        RepositoryProvider<FeatchTicketLotesUsecase>(create: (context) {
          final repository = context.eventRepository();
          return FeatchTicketLotesUsecase(repository);
        }),
        RepositoryProvider<FeatchPdvDatesUsecase>(create: (context) {
          final repository = context.eventRepository();
          return FeatchPdvDatesUsecase(repository);
        }),
      ];

  List<BlocProvider> get listBlocProvider => [
        BlocProvider<StorageBloc>(
          create: (context) {
            final saveUserStorage = context.saveUserStorageUsecase();
            final featchUserStorage = context.featchUserStorageUsecase();
            final clearUserStorage = context.clearUserStorageUsecase();
            return StorageBloc(
              saveUserStorage,
              featchUserStorage,
              clearUserStorage,
              context,
            );
          },
        ),
        BlocProvider<SplashBloc>(
          create: (context) {
            final usecase = context.featchUserStorageUsecase();
            return SplashBloc(usecase);
          },
        ),
        BlocProvider<HomeBloc>(
          create: (context) {
            final usecase = context.featchEventsUsecase();
            return HomeBloc(usecase);
          },
        ),
        BlocProvider<PdvsBloc>(
          create: (context) {
            final usecase = context.featchPdvsUsecase();
            return PdvsBloc(usecase);
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: listRepositoryProvider,
      child: MultiBlocProvider(
        providers: listBlocProvider,
        child: child,
      ),
    );
  }
}
