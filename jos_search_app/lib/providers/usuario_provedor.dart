import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jos_search_app/providers/usuario.dart';

class UsuarioProvedor with ChangeNotifier {
  get http => null;

  Future<void> createAccount(Usuario user) async {
    final url = Uri.parse('http://45.35.64.173:9095/api/Usuario');

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
