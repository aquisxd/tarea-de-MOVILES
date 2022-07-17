import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'LLamada.dart';
import 'sms.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  int _paginaActual = 1;

  final List<Widget> _paginas = [
    ProfileScreen(),
    Llamada(),
    Sms(),
    // Asistencia(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: _paginas[_paginaActual],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState((){
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.phone),label: "Llamadas"),
            BottomNavigationBarItem(icon: Icon(Icons.sms), label: "sms"),
            //        BottomNavigationBarItem(icon: Icon(Icons.phone_android), label: "Asistencia")
          ],
        ) ,
      ),
    );
  }
}