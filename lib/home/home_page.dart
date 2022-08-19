import 'package:flutter/material.dart';
import 'package:socuellamo/gastronomia/view/gastronomia_page.dart';
import 'package:socuellamo/lugar/view/lugar_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          Card(
            child: InkWell(
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text('Lugar'),
              ),
              onTap: () {
                Navigator.of(context).push(LugarPage.route());
              },
            ),
          ),
          Card(
            child: InkWell(
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text('Gastronomia'),
              ),
              onTap: () {
                Navigator.of(context).push(GastronomiaPage.route());
              },
            ),
          ),
        ],
      ),
    );
  }
}
