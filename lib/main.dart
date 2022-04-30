import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:luanaalert/entrega.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

Future<Entrega> fetchEntrega() async {
  final response =
      await http.get(Uri.parse('http://luana.host/api/apientrega/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Entrega.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class _MyAppState extends State<MyApp> {
  String title = 'Luana Alerta';

  void updateLista() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: const <Widget>[
            ListTile(
              leading: Image(
                image: AssetImage('assets/images/cashe.png'),
              ),
              title: Text('Nº de Ref.:'),
              subtitle: Text('Dados do Cliente'),
              //done - pendente; done_all - a caminho; not_interested - cancelado
              trailing: Icon(Icons.star),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Actulizar',
          child: Icon(Icons.cached),
          onPressed: updateLista,
        ),
      ),
    );
    ;
  }
}
