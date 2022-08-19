import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:socuellamo/common/model/model.dart';

class GastronomiaRepository {
  GastronomiaRepository({required Dio? client}) : _client = client ?? Dio();

  final Dio _client;

  Future<List<Modelo>> getInfo() async {
    final response = await _client.requestUri(
        Uri.parse('${_client.options.baseUrl}/gastronomia'),
        options: Options(method: 'GET', contentType: 'application/json'));

    final info = response.data!
        .map<Modelo>((e) => Modelo.fromJson(e as Map<String, dynamic>));

    return info.toList();
  }
}
