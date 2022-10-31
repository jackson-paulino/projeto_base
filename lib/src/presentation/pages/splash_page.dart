import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/utils/extension.dart';
import '../bloc/splash/splash_bloc.dart';
import '../bloc/splash/splash_event.dart';
import '../bloc/splash/splash_state.dart';
import '../bloc/storage/storage_bloc.dart';
import '../bloc/storage/storage_event.dart';
import '../bloc/storage/storage_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  Future<void> featchUserStorage(StorageBloc storageBloc) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    storageBloc.add(FeatchUserStorageEvent());
  }

  @override
  Widget build(BuildContext context) {
    final splashBloc = context.splashBloc();
    final storageBloc = context.storageBloc();
    splashBloc.add(InitialSplashEvent());
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SplashBloc, SplashState>(
            bloc: splashBloc,
            builder: (context, splashState) {
              bool anime = false;
              if (splashState is SplashInitialAnimetedState) {
                anime = splashState.animated;
                featchUserStorage(storageBloc);
              }
              return BlocBuilder<StorageBloc, StorageState>(
                bloc: storageBloc,
                builder: (context, storageState) {
                  if (storageState is StorageFeatchUserFinishedState) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (context.user().token == '') {
                        Navigator.pushReplacementNamed(context, '/login');
                      } else {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    });
                  } else if (storageState is StorageFailureState) {
                    return Center(child: Text(storageState.errorException.message));
                  }
                  return AnimatedAlign(
                    duration: const Duration(milliseconds: 500),
                    alignment: anime ? Alignment.center : Alignment.bottomLeft,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                      width: anime ? 250 : 0,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
