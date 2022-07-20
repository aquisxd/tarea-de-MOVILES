import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'LLamada.dart';
import 'sms.dart';
import 'myapp.dart';


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
    Home (),
  ];
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'UPEU',
      home: Scaffold(
       drawer:  Drawer(
           child: Container(
            color: Colors.white ,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Image.network("https://fannyricardi.files.wordpress.com/2011/08/upeu-6501221.jpeg"),
                ),
                const Text("Proyección Social", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20) ,),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text("Crear Actividad"),
                
                ),
                ElevatedButton(
                  child: const Text("Asistencia"),
                  onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                  },
                ),
                Container(
                   margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text("Configuración"),
                ),
                Expanded(child: Container()),
                Container(
                   margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 5, 67, 117),
                  child: const Text("Salir", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ]
              ),
           ),
       ), 
        appBar: AppBar(
          title: const Text('Proyección Social '),
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
          //  BottomNavigationBarItem(icon: Icon(Icons.phone_android), label: "myapp")
          ],
        ) ,
      ),
    );
  }
}