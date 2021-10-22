//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notificaciones/models/parking_model.dart';


class AddScreen extends StatelessWidget {
  
  //object
  final parqueo = new Parking();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitar ingreso'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
          child: Column(
            children: [
              Text('DATOS'),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (value) {
                  parqueo.nombre = value;
                },
                maxLength: 20,
              ),
              SizedBox(height: 0.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Placa',
                  prefixIcon: Icon(Icons.car_rental),
                ),
                onChanged: (value) {
                  parqueo.placa = value;
                },
                maxLength: 20,
              ),
              SizedBox(height: 0.0),
              TextField(
                onChanged: (value) {
                  parqueo.cedula = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Cedula',
                ),
              ),
              SizedBox(height: 15.0),

              ElevatedButton(
                  onPressed: () async {
                    final data = await enviarDatos(parqueo.toJson());
                    print(data);
                    if (data != null) {
                      print('enviado');
                    } else {
                      print('problemas');
                    }
                    
                  },
                  child: Text('ENVIAR'))
            ],
          ),
        ),
      ),
    );
  }

  Future<Parking?> enviarDatos(Map json) async {
    final url = Uri.parse('https://ad59-2803-1800-51c4-894e-c88a-5c16-d87a-93f6.ngrok.io/parking');
    final response = await http.post(url,  body: json);
    print(response.body);
    if (response.statusCode == 200) {
      return parkingFromJson(response.body);
    } else {
      return null;
    }
  }
}