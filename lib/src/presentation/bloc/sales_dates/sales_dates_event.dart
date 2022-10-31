abstract class SalesDatesEvent {}

class FeatchSalesDatesEvent implements SalesDatesEvent {
  final String eventId;

  FeatchSalesDatesEvent(this.eventId);
}
