import 'user_pdv.dart';

class Pdv {
  int? id;
  String? responsable;
  String? name;
  String? cpf;
  String? cnpj;
  String? phone;
  String? email;
  String? placeOfEstablishment;
  String? street;
  String? number;
  String? neighborhood;
  String? city;
  String? state;
  String? complement;
  int? userId;
  String? createdAt;
  String? updatedAt;
  UserPdv? user;

  Pdv({
    this.id,
    this.responsable,
    this.name,
    this.cpf,
    this.cnpj,
    this.phone,
    this.email,
    this.placeOfEstablishment,
    this.street,
    this.number,
    this.neighborhood,
    this.city,
    this.state,
    this.complement,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });
}
