
import 'models/entities/client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ClientService {
  
  static Future<List<Client>> getClients() async {

    var url = Uri.parse('http://10.0.0.5/EjemploApi/api/Clientes');

    final response = await http.get(url);
    
    if(response.statusCode == 200){

      Iterable I = json.decode(response.body);
      List<Client> clients = List<Client>.from(I.map((model) => Client.fromJson(model)));
      return clients;

    } else {
      return null;
    }

  }

  static Future<bool> createClient(Client c) async {

    var url = Uri.parse('http://10.0.0.5/EjemploApi/api/Clientes');

    final response = await http.post(url,
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8',
      },
      body: jsonEncode(c.toJson())

    );
    
    if(response.statusCode == 201){
      return true;
    } else {
      return false;
    }

  }
}