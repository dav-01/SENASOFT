import 'package:flutter/material.dart';
import 'package:notificaciones/screens/add_screen.dart';

class HomeScreem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('MyParking')),
      ),
      body: Center(
        child: Text(' '),
      ),
    
    floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orangeAccent,
          child: Icon(Icons.add),
          onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddScreen();
              }),
            );
          }
      ),
    //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
      color: Colors.orange[200],
    ),
    );
  }
}
