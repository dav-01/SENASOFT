import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notificaciones/models/parqueo_model.dart';
import 'dart:convert';



class AddScreen extends StatelessWidget {
  //object
  final parqueo = new Parqueo();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
          child: Column(
            children: [
              Text('FORMULARIO'), //title
              SizedBox(
                height: 15.0,
              ),
              //input
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Placa',
                  prefixIcon: Icon(Icons.car_rental),
                ),
                onChanged: (value) {
                  parqueo.placa = value;
                },
                keyboardType: TextInputType.text,
                maxLength: 12,
              ),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cedula',
                  prefixIcon: Icon(Icons.perm_identity_sharp),
                ),
                onChanged: (value) {
                  parqueo.cedula = value;
                },
                keyboardType: TextInputType.text,
                maxLength: 20,
              ),
              
              SizedBox(height: 0.0),

              ElevatedButton(
                  onPressed: () async {
                    final respuesta = await enviarDatos(parqueo.toJson());
                    if (respuesta != null) {
                      print('enviado');
                    } else {
                      print('problemas');
                    }
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Respuesta(Parqueo: Parqueo)));
                  },
                  child: Text('ENVIAR'))
            ],
          ),
        ),
      ),
    );
  }

  Future<Parqueo?> enviarDatos(Map json) async {
    print('dato: $json');
    final url = Uri.parse('https://5e5a-190-61-42-174.ngrok.io/parking');
    final response = await http.post(url, body: json);

    if (response.statusCode == 201) {
      print('dato 2: $json');
      final dato = jsonDecode(response.body);
      return Parqueo.fromJson(dato);
    } else {
      return null;
    }
  }
}