import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@JsonSerializable()
class Client {
  Client();

  @JsonKey(name: 'ClienteID') int clienteID;
  @JsonKey(name: 'Nombre') String name;
  @JsonKey(name: 'Apellidos') String lastname;
  @JsonKey(name: 'Estado') int status;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}