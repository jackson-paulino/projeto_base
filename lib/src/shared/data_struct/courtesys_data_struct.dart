import '../../domain/entities/courtesy.dart';
import 'lotes_data_struct.dart';

class CourtesysDataStruct {
  String name;
  String eventId;
  List<LotesDataStruct> lotes;

  CourtesysDataStruct._({
    required this.name,
    required this.eventId,
    required this.lotes,
  });

  static CourtesysDataStruct fromDataStruct(Courtesy data) {
    List<LotesDataStruct> lotes = <LotesDataStruct>[];
    for (var element in data.lotes!) {
      final item = LotesDataStruct.fromDataStruct(element);
      lotes.add(item);
    }
    return CourtesysDataStruct._(
      name: data.name ?? '',
      eventId: (data.eventId ?? '').toString(),
      lotes: lotes,
    );
  }
}
