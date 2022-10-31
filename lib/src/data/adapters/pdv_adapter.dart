import '../../domain/entities/pdv.dart';
import 'user_pdv_adapter.dart';

class PdvAdapter {
  static Pdv fromJson(Map<String, dynamic> data) {
    return Pdv(
      id: data['id'],
      responsable: data['responsable'],
      name: data['name'],
      cpf: data['cpf'],
      cnpj: data['cnpj'],
      phone: data['phone'],
      email: data['email'],
      placeOfEstablishment: data['place_of_establishment'],
      street: data['street'],
      number: data['number'],
      neighborhood: data['neighborhood'],
      city: data['city'],
      state: data['state'],
      complement: data['complement'],
      userId: data['user_id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      user: data['user'] != null ? UserPdvAdapter.fromJson(data['user']) : null,
    );
  }
}
