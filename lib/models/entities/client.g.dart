// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client()
    ..clienteID = json['ClienteID'] as int
    ..name = json['Nombre'] as String
    ..lastname = json['Apellidos'] as String
    ..status = json['Estado'] as int;
}

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'ClienteID': instance.clienteID,
      'Nombre': instance.name,
      'Apellidos': instance.lastname,
      'Estado': instance.status,
    };
