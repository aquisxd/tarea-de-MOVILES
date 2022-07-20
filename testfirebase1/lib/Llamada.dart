import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

void main() => runApp(const Llamada());

class Llamada extends StatefulWidget {
  const Llamada({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  Widget buil(BuildContext context) {
    return Center(
      child: Text(
        "Llamadas",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class _MyAppState extends State<Llamada> {
  final TextEditingController _numberCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "085921191121";
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Llamada desde Flutter'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _numberCtrl,
                decoration: const InputDecoration(labelText: "Número de celar"),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              child: const Text("Llamar"),
              onPressed: () async {
                FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
              },
            )
          ],
        ),
      ),
    );
  }
}