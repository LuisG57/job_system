import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exceptions.dart';

class UserItem {
  final int? idUsuario;
  final String? nombre;
  final String? apellido;
  final int? idTipoUsuario;
  final String? clave;
  final String? correo;
  final bool? estatus;
  final String? fechaCreacion;
  final int? idCategoria;
  final String? descripcion;
  final String? logo;
  final String? url;
  final String? categoria;
  final String? tipoUsuario;
  final List<int>? puestos;
  final String? uniqueId;
  UserItem({
    required this.idUsuario,
    required this.nombre,
    required this.apellido,
    this.idTipoUsuario,
    required this.clave,
    required this.correo,
    required this.estatus,
    required this.fechaCreacion,
    this.idCategoria,
    this.descripcion,
    required this.logo,
    required this.url,
    this.categoria,
    this.tipoUsuario,
    this.puestos,
    required this.uniqueId,
  });
}

class UserAuthService with ChangeNotifier {
  // List<PuestoItem> _puestoItems = [];

  late UserItem _usuario;

  // Map<String, PuestoItem> _puestoItems = {};

  // Future<void> addPuestoItem(PuestoItem puestoitem) async {
  //   final url = Uri.parse('http://45.35.64.173:9095/api/Puestos');

  //   try {
  //     final response = await http.post(url,
  //         body: json.encode({
  //           // "compañia": puestoitem.compania,
  //           // "idTipoJornada": 0,
  //           // "logo": "url",
  //           // "url": "url",
  //           // "posicion": puestoitem.posicion,
  //           // "ubicacion": puestoitem.ubicacion,
  //           // "idCategoria": 0,
  //           // "descripcion": puestoitem.descripcion,
  //           // "correoContacto": "correo",
  //           // "idUsuario": 10,
  //           // "fecha": puestoitem.fecha

  //           "compañia": puestoitem.compania,
  //           "idTipoJornada": puestoitem.idTipoJornada,
  //           "logo": "url",
  //           "url": "url",
  //           "posicion": puestoitem.posicion,
  //           "ubicacion": puestoitem.ubicacion,
  //           "idCategoria": 1,
  //           "descripcion": puestoitem.descripcion,
  //           "correoContacto": "correo",
  //           "idUsuario": 2,
  //           "fecha": DateTime.now().toIso8601String()
  //         }),
  //         headers: {
  //           "Accept": "application/json",
  //           "content-type": "application/json"
  //         });

  //     final newPuestoItem = PuestoItem(
  //         idPuesto: puestoitem.idPuesto,
  //         compania: puestoitem.compania,
  //         posicion: puestoitem.posicion,
  //         ubicacion: puestoitem.ubicacion,
  //         idCategoria: puestoitem.idCategoria,
  //         idTipoJornada: puestoitem.idTipoJornada,
  //         descripcion: puestoitem.descripcion,
  //         idUsuario: puestoitem.idUsuario,
  //         estatus: puestoitem.estatus,
  //         fecha: puestoitem.fecha,
  //         correoContacto: '');

  //     _puestoItems.add(newPuestoItem);
  //   } catch (error) {
  //     print(error);
  //     throw error;
  //   }

  //   notifyListeners();
  // }

  // Future<void> updateProduct(String id, PuestoItem newPuestoItem) async {
  //   final puestoIndex =
  //       _puestoItems.indexWhere((element) => element.idPuesto == id);

  //   if (puestoIndex >= 0) {
  //     final url = Uri.parse('');
  //     await http.patch(url,
  //         body: json.encode({
  //           'idPuesto': newPuestoItem.idPuesto,
  //           'compañia': newPuestoItem.compania,
  //           'posicion': newPuestoItem.posicion,
  //           'ubicacion': newPuestoItem.ubicacion,
  //           'idCategoria': newPuestoItem.idCategoria,
  //           'idTipoJornada': newPuestoItem.idTipoJornada,
  //           'descripcionPuesto': newPuestoItem.descripcion,
  //           'idUsuario': newPuestoItem.idUsuario,
  //           'estatus': newPuestoItem.estatus,
  //           'fechaCreacion': newPuestoItem.descripcion,
  //         }));

  //     _puestoItems[puestoIndex] = newPuestoItem;
  //     notifyListeners();
  //   } else {
  //     print('El indice no existe. imposible modificar, por favor revisar. ');
  //   }
  // }

  // Future<void> deletePuestoItem(String id) async {
  //   final url = Uri.parse('');
  //   final existingPuestoItemIndex =
  //       _puestoItems.indexWhere((item) => item.idPuesto == id);
  //   PuestoItem? existingProduct = _puestoItems[existingPuestoItemIndex];
  //   _puestoItems.removeAt(existingPuestoItemIndex);
  //   final response = await http.delete(url);
  //   _puestoItems.removeAt(existingPuestoItemIndex);
  //   notifyListeners();
  //   if (response.statusCode >= 400) {
  //     _puestoItems.insert(existingPuestoItemIndex, existingProduct);
  //     notifyListeners();
  //     throw HttpException('No se pudo eliminar el item');
  //   }
  //   existingProduct = null;
  // }

  Future<bool> userAuth(String? correo, String? clave) async {
    print({'Correo del usuario $correo, cClave del ususario $clave'});
    final url =
        Uri.parse('http://45.35.64.173:9095/api/Usuario/$correo,$clave');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      // final List<PuestoItem> loadedProducts = [];
      // print('Primer print $extractedData');
      // print('Segundo print ${extractedData['result']}');
      if (extractedData['success']) {
        var usuario = extractedData['result'] as Map<String, dynamic>;
        _usuario = UserItem(
            idUsuario: usuario['idUsuario'],
            nombre: usuario['nombre'],
            apellido: usuario['apellido'],
            idTipoUsuario: usuario['idTipoUsuario'],
            clave: usuario['clave'],
            correo: usuario['correo'],
            estatus: usuario['estatus'],
            fechaCreacion: usuario['fechaCreacion'],
            idCategoria: usuario['idCategoria'],
            descripcion: usuario['descripcion'],
            logo: usuario['logo'],
            url: usuario['url'],
            categoria: usuario['categoria'],
            tipoUsuario: usuario['tipoUsuario'],
            uniqueId: usuario['unique']);
      }

      return await extractedData['success'];
    } catch (error) {
      print("Tienes un error en user auth este es el detalle: $error");
      throw error;
    }
  }

  UserItem get user {
    var user = _usuario;
    return user;
  }

  // List<PuestoItem> allPosts = [];
  // List<PuestoItem> getAllPosts() {
  //   List<PuestoItem> clon = new List<PuestoItem>.from(allPosts);
  //   return clon;
  // }
}
