import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/utils/extension.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';
import '../bloc/home/home_state.dart';
import '../bloc/storage/storage_bloc.dart';
import '../bloc/storage/storage_event.dart';
import '../bloc/storage/storage_state.dart';
import '../widgets/custom_item.dart';
import '../widgets/floating_bubble.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storageBloc = context.storageBloc();
    final bloc = context.homeBloc();
    final user = context.user();
    return BlocBuilder<StorageBloc, StorageState>(
      bloc: storageBloc,
      builder: (context, storageState) {
        if (storageState is StorageClearUserState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, '/login');
          });
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (storageState is StorageLoadingState) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (storageState is StorageFeatchUserFinishedState) {
          return Scaffold(
            appBar: AppBar(title: Text(user.name)),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton:
                FloatingBubble(onPress: (value) => bloc.add(FeatchEventsEvent(eventWon: value))),
            body: RefreshIndicator(
              onRefresh: () async => bloc.add(FeatchEventsEvent()),
              child: BlocBuilder<HomeBloc, HomeState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is HomeInitialState) {
                    bloc.add(FeatchEventsEvent());
                  } else if (state is HomeFailureState) {
                    return Center(child: Text(state.errorException.message));
                  } else if (state is HomeFeatchFinishedState) {
                    if (state.events.isEmpty) {
                      return const Center(child: Text('Nenhum eventos encontrado'));
                    }
                    return ListView.builder(
                      itemCount: state.events.length,
                      itemBuilder: (context, index) {
                        return CustomItem(event: state.events[index]);
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          );
        }
        storageBloc.add(FeatchUserStorageEvent());
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
