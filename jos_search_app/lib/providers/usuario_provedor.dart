import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:jos_search_app/providers/usuario.dart';

class UsuarioProvedor with ChangeNotifier {
  Future<void> createAccount(Usuario user) async {
    final url = Uri.parse('http://45.35.64.173:9095/api/Usuario');
    // final url = Uri.http('http://45.35/api', '/Usuario');

    // print(user.nombre.toString());

    try {
      final response = await http.post(url,
          body: json.encode({
            // 'idUsuario': 1,

            'nombre': user.nombre,
            'apellido': user.apellido,
            'idTipoUsuario': 1,
            'clave': user.clave,
            'correo': user.correo,
            'estatus': true,
            'fechaCreacion': DateTime.now().toIso8601String(),
            'idCategoria': 1,
            'descripcion': user.descripcion,
            'nombreArchivo': user.logo,
            'url': user.logo,
            'base64Image': user.url,

            // "nombre": "pupy",
            // "apellido": "frias",
            // "idTipoUsuario": 1,
            // "clave": "12345",
            // "correo": "p",
            // "estatus": true,
            // "fechaCreacion": "2021-10-13T04:18:35.300Z",
            // "idCategoria": 1,
            // "descripcion": "1",
            // "logo": "test",
            // "url": "test"
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });

      print('llegaste');
      print(user.logo);

      // final newUsuario = Usuario(
      //     idUsuario: json.decode(response.body)['name '],
      //     nombre: user.nombre,
      //     apellido: user.apellido,
      //     idTipoUsuario: user.idTipoUsuario,
      //     clave: user.clave,
      //     correo: user.correo,
      //     estatus: user.estatus,
      //     fechaCreacion: user.fechaCreacion,
      //     idCategoria: user.idCategoria,
      //     descripcion: user.descripcion,
      //     logo: user.logo,
      //     url: user.url);
      print(response.statusCode);
      print(response.body);
      print(response);
      print(response.reasonPhrase);
      print(response.headers);
      print(response.request);
      print(response.isRedirect);
    } catch (error) {
      print(error);
      throw error;
    }

    notifyListeners();
  }

  Future<void> signIn(String correo, String clave) async {
    final url = Uri.parse(
        'https://flutter-course-9fa9a-default-rtdb.firebaseio.com/test.json');

    try {
      final response = await http.post(url,
          body: json.encode({
            'correo': correo,
            'clave': clave,
          }));
    } catch (error) {
      print(error);
      throw error;
    }

    notifyListeners();
  }
}



// json.encode({
//             // 'idUsuario': 1,
//             // 'nombre': user.nombre,
//             // 'apellido': user.apellido,
//             // 'idTipoUsuario': user.idTipoUsuario,
//             // 'clave': user.clave,
//             // 'correo': user.correo,
//             // 'estatus': user.estatus,
//             // 'fechaCreacion': user.fechaCreacion.toString(),
//             // 'idCategoria': 1,
//             // 'descripcion': user.descripcion,
//             // 'logo': user.logo,
//             // 'url': user.url,

//             //  'idUsuario': 1,
//             "nombre": "pupy",
//             "apellido": "frias",
//             "idTipoUsuario": 1,
//             "clave": "12345",
//             "correo": "p",
//             "estatus": true,
//             "fechaCreacion": "2021-10-13T04:18:35.300Z",
//             "idCategoria": 1,
//             "descripcion": "1",
//             "logo": "test",
//             "url": "test"
//           })