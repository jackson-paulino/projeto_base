import '../../domain/entities/event.dart';

class EventAdapter {
  static Event fromJson(Map<String, dynamic> data) {
    return Event(
      eventId: data['event_id'],
      eventName: data['event_name'],
      eventDate: data['event_date'],
      eventLocal: data['event_local'],
      eventImage: data['event_image'],
      eventImageLogo: data['event_image_logo'],
      quantitySoldToday: data['quantity_sold_today'],
      totalSoldToday: data['total_sold_today'],
      quantitySoldAll: data['quantity_sold_all'],
      totalSoldAll: data['total_sold_all'],
    );
  }
}
