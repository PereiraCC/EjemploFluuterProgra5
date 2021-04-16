import 'package:ejemplo_consumo_api/client_service.dart';
import 'package:flutter/material.dart';

import 'models/entities/client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejemplo Consumo API',
      
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Ejemplo Consumo API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Client>> clientes;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _createClient();
            },
          )
        ],
      ),
      body: _createBody(),
    );
  }

  Widget _createBody() {
    clientes = ClientService.getClients();
    return FutureBuilder(  
      future: clientes,
      builder: ( _ , AsyncSnapshot<List<Client>> snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(  
                title: Text((snapshot.data[index].name == null 
                            ? "" 
                            : snapshot.data[index].name) + 
                            " " + 
                            snapshot.data[index].lastname
                ),
                subtitle: Text((snapshot.data[index].status == 0 
                            ? "Deshabilitado" 
                            : "Habilitado"),
                ),
              );
            }
          );
        }
        else{
          return Text('Cargando');
        }
      },
    );
  }

  void _createClient() async{

    var c = Client();
    c
    ..clienteID = 0
    ..name = "Ejemplo Flutter 2"
    ..lastname = "Progra 5"
    ..status = 0;

    if(await ClientService.createClient(c)){
      final snackBar = SnackBar(content: Text("Cliente creado con exito"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {

      });
    } else {
      final snackBar = SnackBar(content: Text("Error creado un cliente"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }
}
