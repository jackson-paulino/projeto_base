import '../../domain/entities/pdv.dart';
import '../../domain/entities/user_pdv.dart';
import 'user_pdv_data_struct.dart';

class PdvDataStruct {
  String id;
  String responsable;
  String name;
  String cpf;
  String cnpj;
  String phone;
  String email;
  String placeOfEstablishment;
  String street;
  String number;
  String neighborhood;
  String city;
  String state;
  String complement;
  String userId;
  String createdAt;
  String updatedAt;
  UserPdvDataStruct user;

  PdvDataStruct({
    required this.id,
    required this.responsable,
    required this.name,
    required this.cpf,
    required this.cnpj,
    required this.phone,
    required this.email,
    required this.placeOfEstablishment,
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.complement,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  static PdvDataStruct fromDataStruct(Pdv data) {
    return PdvDataStruct(
        id: (data.id ?? 0).toString(),
        responsable: data.responsable ?? '',
        name: data.name ?? '',
        cpf: data.cpf ?? '',
        cnpj: data.cnpj ?? '',
        phone: data.phone ?? '',
        email: data.email ?? '',
        placeOfEstablishment: data.placeOfEstablishment ?? '',
        street: data.street ?? '',
        number: data.number ?? '',
        neighborhood: data.neighborhood ?? '',
        city: data.city ?? '',
        state: data.state ?? '',
        complement: data.complement ?? '',
        userId: (data.userId ?? 0).toString(),
        createdAt: data.createdAt ?? '',
        updatedAt: data.updatedAt ?? '',
        user: UserPdvDataStruct.fromDataStruct(data.user ?? UserPdv()));
  }
}
