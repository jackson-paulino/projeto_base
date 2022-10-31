import '../../../domain/entities/user.dart';

abstract class HomeEvent {}

class InitializeHomeEvent implements HomeEvent {
  InitializeHomeEvent();
}

class SubmitUserStorageEvent implements HomeEvent {
  final User user;

  SubmitUserStorageEvent(this.user);
}

class FeatchEventsEvent implements HomeEvent {
  final bool eventWon;

  FeatchEventsEvent({this.eventWon = false});
}
