abstract class WithdrawPdvsEvent {}

class FeatchWithdrawPdvsEvent implements WithdrawPdvsEvent {
  final String eventId;

  FeatchWithdrawPdvsEvent(this.eventId);
}
