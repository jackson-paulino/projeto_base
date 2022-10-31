abstract class SalesPdvEvent {}

class FeatchSalesPdvEvent implements SalesPdvEvent {
  final String eventId;

  FeatchSalesPdvEvent(this.eventId);
}
