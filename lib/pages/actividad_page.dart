import 'package:ejm_provid/provider/change_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ActividadPage extends StatelessWidget {
  const ActividadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List photos = [
      'https://falabella.scene7.com/is/image/FalabellaPE/18148522_1?wid=1004&hei=1500&crop=248,0,1004,1500&qlt=70',
      'https://falabella.scene7.com/is/image/FalabellaPE/18046905_1?wid=1004&hei=1500&crop=248,0,1004,1500&qlt=70',
      'https://falabella.scene7.com/is/image/FalabellaPE/18996295_1?wid=1004&hei=1500&crop=248,0,1004,1500&qlt=70',
      'https://falabella.scene7.com/is/image/FalabellaPE/18975794_1?wid=1004&hei=1500&crop=248,0,1004,1500&qlt=70',
    ];

    List pantalones = [
      'https://falabella.scene7.com/is/image/FalabellaPE/881377217_1?wid=800&hei=800&qlt=70',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEsX9xlKsQ27fNYqaCzWXwDBh5DLnFprQRFQ&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_KjCC8FlwJOvOPo-YQ9VPvxY6zOuZzqMTNA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMSl8QdS5YfRWYoRJRmsrbA0vxVmSo36emWMdQJfw3T_qcB-tlOaonOODh93tg38QXV_k&usqp=CAU',
    ];

    final cambio = Provider.of<ChangeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tienda Virtual',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Switch anuncio
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Mostrar anuncio',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Switch(
                  value: cambio.dato,
                  onChanged: (value) {
                    cambio.cambiar(value);
                    cambio.btnMostrarAlerta();
                  },
                ),
              ],
            ),

            //Switch polos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Mostrar categoria polos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Switch(
                  value: cambio.dato1,
                  onChanged: (value) {
                    cambio.cambiar1(value);
                    cambio.btnMostrarAlerta();
                  },
                ),
              ],
            ),

            //Switch pantalones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Mostrar categoria pantalones',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Switch(
                  value: cambio.dato2,
                  onChanged: (value) {
                    cambio.cambiar2(value);
                    cambio.btnMostrarAlerta();
                  },
                ),
              ],
            ),

            //Anuncio
            Visibility(
              visible: cambio.isEmpty,
              child: Lottie.network(
                  'https://assets6.lottiefiles.com/private_files/lf30_e3pteeho.json'),
            ),

            const SizedBox(height: 20.0),
            Visibility(
              visible: cambio.dato,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.network(
                  'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            //Lista de polos
            Visibility(
              visible: cambio.dato1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Polos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: photos.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          width: 150,
                          height: 150,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                photos[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.grey,
                          ),
                          child: Text('Producto $index'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            //
            const SizedBox(height: 20.0),

            //Lista de pantalones
            Visibility(
              visible: cambio.dato2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Pantalones',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: pantalones.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                pantalones[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.grey,
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Text('Producto $index'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
