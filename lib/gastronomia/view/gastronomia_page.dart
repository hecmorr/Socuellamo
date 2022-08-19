import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socuellamo/common/widgets/home_widget.dart';
import 'package:socuellamo/gastronomia/bloc/gastronomia_bloc.dart';
import 'package:socuellamo/gastronomia/repository/gastronomia_repository.dart';

class GastronomiaPage extends StatelessWidget {
  const GastronomiaPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
        builder: (context) => const GastronomiaPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        //Leer el tipo de repositorio gracias a la inyeccion de dependencias
        final bloc =
            GastronomiaBloc(repository: context.read<GastronomiaRepository>())
              ..add(const GastronomiaFetched());
        return bloc;
      },
      child: const GastronomiaView(),
    );
  }
}

class GastronomiaView extends StatelessWidget {
  const GastronomiaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gastronomia'),
      ),
      body: BlocBuilder<GastronomiaBloc, GastronomiaState>(
        builder: (context, state) {
          if (state is GastronomiaLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GastronomiaLoadSuccess) {
            return ModeloList(modelo: state.lista);
          }
          if (state is GastronomiaLoadFailure) {
            return Center(child: Text(state.message));
          }

          return const Text('Initial List');
        },
      ),
    );
  }
}
