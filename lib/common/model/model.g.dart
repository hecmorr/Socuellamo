// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Modelo _$ModeloFromJson(Map<String, dynamic> json) => Modelo(
      json['titulo'] as String,
      json['direccion'] as String,
      json['id'] as int,
      (json['imagen'] as List<dynamic>)
          .map((e) => Imagen.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['descripcion'] as String,
    );

Imagen _$ImagenFromJson(Map<String, dynamic> json) => Imagen(
      json['guid'] as String,
    );
