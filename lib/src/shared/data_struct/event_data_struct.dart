import '../../domain/entities/event.dart';
import '../utils/app_format.dart';

class EventDataStruct {
  String eventId;
  String eventName;
  String eventDate;
  String eventLocal;
  String? eventImage;
  String? eventImageLogo;
  String quantitySoldToday;
  String totalSoldToday;
  String quantitySoldAll;
  String totalSoldAll;

  EventDataStruct._({
    required this.eventId,
    required this.eventName,
    required this.eventDate,
    required this.eventLocal,
    required this.eventImage,
    required this.eventImageLogo,
    required this.quantitySoldToday,
    required this.totalSoldToday,
    required this.quantitySoldAll,
    required this.totalSoldAll,
  });

  static EventDataStruct fromDataStruct(Event data) {
    return EventDataStruct._(
      eventId: (data.eventId ?? 0).toString(),
      eventName: data.eventName ?? '',
      eventDate: AppFormat.dateTime
          .format(DateTime.tryParse(data.eventDate!) ?? DateTime.now()),
      eventLocal: data.eventLocal ?? '',
      eventImage: data.eventImage,
      eventImageLogo: data.eventImageLogo,
      quantitySoldToday: AppFormat.quantity.format(data.quantitySoldToday ?? 0),
      totalSoldToday: AppFormat.money.format(data.totalSoldToday ?? 0),
      quantitySoldAll: AppFormat.quantity.format(data.quantitySoldAll ?? 0),
      totalSoldAll: AppFormat.money.format(data.totalSoldAll ?? 0),
    );
  }
}
