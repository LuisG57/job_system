import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Usuario {
  final String idUsuario;
  final String nombre;
  final String apellido;
  final String idTipoUsuario;
  final String clave;
  final String correo;
  final String estatus;
  final String fechaCreacion;
  final String idCategoria;
  final String descripcion;
  final String logoUrl;
  final String websiteUrl;

  Usuario(
      {required this.idUsuario,
      required this.nombre,
      required this.apellido,
      required this.idTipoUsuario,
      required this.clave,
      required this.correo,
      required this.estatus,
      required this.fechaCreacion,
      required this.idCategoria,
      required this.descripcion,
      required this.logoUrl,
      required this.websiteUrl});
}

class UsuarioProvedor with ChangeNotifier {
  Future<void> createAccount(Usuario user) async {
    final url = Uri.parse(
        'https://flutter-course-9fa9a-default-rtdb.firebaseio.com/test.json');

    try {
      final response = await http.post(url,
          body: json.encode({
            'idUsuario': DateTime.now().toString(),
            'nombre': user.nombre,
            'apellido': user.apellido,
            'idTipoUsuario': user.idTipoUsuario,
            'clave': user.clave,
            'correo': user.correo,
            'estatus': user.estatus,
            'fechaCreacion': user.fechaCreacion,
            'idCategoria': user.idCategoria,
            'descripcion': user.descripcion,
            'logoUrl': user.logoUrl,
            'websiteUrl': user.websiteUrl,
          }));

      final newUsuario = Usuario(
          idUsuario: json.decode(response.body)['name '],
          nombre: user.nombre,
          apellido: user.apellido,
          idTipoUsuario: user.idTipoUsuario,
          clave: user.clave,
          correo: user.correo,
          estatus: user.estatus,
          fechaCreacion: user.fechaCreacion,
          idCategoria: user.idCategoria,
          descripcion: user.descripcion,
          logoUrl: user.logoUrl,
          websiteUrl: user.websiteUrl);
    } catch (error) {
      print(error);
      throw error;
    }

    notifyListeners();
  }
}
