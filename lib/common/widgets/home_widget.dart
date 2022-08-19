import 'package:flutter/cupertino.dart';
import 'package:socuellamo/common/model/model.dart';

class ModeloList extends StatelessWidget {
  const ModeloList({Key? key, required this.modelo}) : super(key: key);

  final List<Modelo> modelo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: modelo.length,
        itemBuilder: (context, index) {
          final list = modelo[index];
          return SizedBox(
            child: Text(list.title),
          );
        });
  }
}
