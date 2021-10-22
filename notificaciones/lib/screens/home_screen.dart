import 'package:flutter/material.dart';
import 'package:notificaciones/models/parking_model.dart';
import 'package:notificaciones/screens/add_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreem extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Myparking'),
      ),
      body: FutureBuilder(
        future: traerInformacionApi(), //future
        builder: (context, AsyncSnapshot<List<Parking>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final parkings = snapshot.data;
            print(parkings); //PRIN
            return ListView.builder(
              itemCount: parkings!.length,
              itemBuilder: (BuildContext context, int index) {
                final parking = parkings[index];
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(parking.placa),
                  subtitle: Text(parking.cedula),
                  trailing: Icon(Icons.keyboard_arrow_right),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator()); //cargando
          }
        },
      ),


      // action button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

  //get 
  Future<List<Parking>?> traerInformacionApi() async {
  final url = Uri.parse('https://b09c-2803-1800-5106-44d4-93eb-5bdb-3cc1-2f16.ngrok.io/parking');
  final response = await http.get(url);
  print(response);
  if (response.statusCode == 200) {
    return parkingsFromJson(response.body);
  } else {
    return null;
  }
  }

