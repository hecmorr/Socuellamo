import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socuellamo/gastronomia/repository/gastronomia_repository.dart';
import 'package:socuellamo/home/home_page.dart';
import 'package:socuellamo/lugar/repository/lugar_repository.dart';

//Inyeccion de dependencias en el nivel mas alto
void main() {
  final Dio _client = Dio(
    BaseOptions(
        baseUrl:
            'https://ayuntamientos.barlovento.estudioalfa.com/wp-json/wp/v2'),
  );
  //Inicializacion de repositorios con los clientes
  final LugarRepository lugarRepository = LugarRepository(client: _client);
  final GastronomiaRepository gastronomiaRepository =
      GastronomiaRepository(client: _client);
  runApp(MyApp(
    //Instanciar repositorios
    lugarRepository: lugarRepository,
    gastronomiaRepository: gastronomiaRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {Key? key,
      required LugarRepository lugarRepository,
      required GastronomiaRepository gastronomiaRepository})
      : _lugarRepository = lugarRepository,
        _gastronomiaRepository = gastronomiaRepository,
        super(key: key);

  final LugarRepository _lugarRepository;
  final GastronomiaRepository _gastronomiaRepository;
  @override
  Widget build(BuildContext context) {
    //Declaracion de multiples repositorys
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _lugarRepository,
        ),
        RepositoryProvider.value(
          value: _gastronomiaRepository,
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
