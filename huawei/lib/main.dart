//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:notificaciones/screens/add_screen.dart';
import 'package:notificaciones/screens/home_screen.dart';
import 'package:notificaciones/screens/message_screen.dart';
import 'package:notificaciones/services/push_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //generate a contex before
  await PushNotificationService.initializeApp(); //call for initialize service
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //final GlobalKey<NavigatorState> navigatorKey =
  // new GlobalKey<NavigatorState>();
  //final GlobalKey<ScaffoldMessengerState> messengerKey =
  //new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    //context
    PushNotificationService.messageStream.listen((message) {
      print('MyApp: $message');
      //navigatorKey.currentState?.pushNamed('message', arguments: message);
      //final snackBar = SnackBar(content: Text(message));
      //messengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home', //inicia pantalla en el home
      //navigatorKey: navigatorKey, //Navegar
      //scaffoldMessengerKey: messengerKey, //Snacks
      routes: {
        'home':    (_) => HomeScreem(),
        'message': (_) => MessageScreen(),
        'add':     (_) => AddScreen(),
      },
    );
  }
}
