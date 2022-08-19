import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable(createToJson: false)
class Modelo {
  Modelo(this.title, this.direccion, this.id, this.imagen, this.descripcion);
  factory Modelo.fromJson(Map<String, dynamic> json) => _$ModeloFromJson(json);
  @JsonKey(name: 'titulo')
  final String title;
  final String descripcion;
  final int id;
  final List<Imagen> imagen;
  final String direccion;
}

@JsonSerializable(createToJson: false)
class Imagen {
  Imagen(this.guid);
  factory Imagen.fromJson(Map<String, dynamic> json) => _$ImagenFromJson(json);
  final String guid;
}
