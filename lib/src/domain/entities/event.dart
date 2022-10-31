class Event {
  int? eventId;
  String? eventName;
  String? eventDate;
  String? eventLocal;
  String? eventImage;
  String? eventImageLogo;
  int? quantitySoldToday;
  num? totalSoldToday;
  int? quantitySoldAll;
  num? totalSoldAll;

  Event({
    this.eventId,
    this.eventName,
    this.eventDate,
    this.eventLocal,
    this.eventImage,
    this.eventImageLogo,
    this.quantitySoldToday,
    this.totalSoldToday,
    this.quantitySoldAll,
    this.totalSoldAll,
  });
}
