abstract class TicketSalesEvent {}

class FeatchTicketSalesEvent implements TicketSalesEvent {
  final String eventId;

  FeatchTicketSalesEvent(this.eventId);
}
