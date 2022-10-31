abstract class PdvDatesEvent {}

class FeatchPdvDatesEvent implements PdvDatesEvent {
  final String eventId;
  final String pdvId;

  FeatchPdvDatesEvent(this.eventId, this.pdvId);
}
