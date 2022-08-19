import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socuellamo/common/widgets/home_widget.dart';
import 'package:socuellamo/lugar/bloc/lugar_bloc.dart';
import 'package:socuellamo/lugar/repository/lugar_repository.dart';

class LugarPage extends StatelessWidget {
  const LugarPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const LugarPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LugarBloc>(
      create: (context) {
        final bloc = LugarBloc(repository: context.read<LugarRepository>())
          ..add(const InfoFetched());
        return bloc;
      },
      child: const LugarView(),
    );
  }
}

class LugarView extends StatelessWidget {
  const LugarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lugar'),
      ),
      body: BlocBuilder<LugarBloc, LugarState>(
        builder: (context, state) {
          if (state is InfoLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is InfoLoadSuccess) {
            return ModeloList(modelo: state.lista);
          }
          if (state is InfoLoadFailure) {
            return Center(child: Text(state.message));
          }

          return const Text('Initial List');
        },
      ),
    );
  }
}
