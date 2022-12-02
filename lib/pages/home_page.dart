import 'package:ejm_provid/provider/change_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cambio = Provider.of<ChangeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: (cambio.dato == false)
            ? const Text('Provider')
            : const Text('Bienvenido'),
        actions: [
          Switch(
            value: cambio.dato,
            onChanged: (value) {
              cambio.cambiar(value);
            },
          ),
          IconButton(
            onPressed: () {
              cambio.btnCambiar();
            },
            icon: const Icon(Icons.android),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 150,
                  color: Colors.red,
                ),
                Visibility(
                  visible: cambio.dato1,
                  child: Container(
                    width: 150,
                    color: Colors.amber,
                  ),
                ),
                Container(
                  width: 150,
                  color: Colors.green,
                ),
                Container(
                  width: 150,
                  color: Colors.blue,
                ),
                Container(
                  width: 150,
                  color: Colors.purple,
                ),
                Container(
                  width: 150,
                  color: Colors.pink,
                ),
              ],
            ),
          ),

          //Button
          Visibility(
            visible: cambio.dato1,
            child: const Center(
              child: Text(
                'Bienvenido 2023',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
