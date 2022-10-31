abstract class PdvsEvent {}

class FeatchPdvsEvent implements PdvsEvent {
  final String eventId;

  FeatchPdvsEvent(this.eventId);
}
