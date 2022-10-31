import '../../domain/entities/courtesy.dart';
import '../../domain/entities/lote.dart';
import 'lotes_adapter.dart';

class CourtesysAdapter {
  static Courtesy fromJson(Map<String, dynamic> data) {
    List<Lotes> lotes = <Lotes>[];
    if (data['lotes'] != null) {
      data['lotes'].forEach((v) {
        lotes.add(LotesAdapter.fromJson(v));
      });
    }
    return Courtesy(
      name: data['name'],
      eventId: data['event_id'],
      lotes: lotes,
    );
  }
}
