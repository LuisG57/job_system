import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exceptions.dart';

class PuestoItem {
  final String? idPuesto; // no hay
  final String? compania;
  final String? posicion;
  final String? ubicacion;
  final int? idCategoria;
  final int? idTipoJornada;
  final String? descripcion;
  final int? idUsuario;
  final String? estatus;
  final String? correoContacto;
  final String? fecha;

  PuestoItem(
      {required this.idPuesto,
      required this.compania,
      required this.posicion,
      required this.ubicacion,
      required this.idCategoria,
      required this.idTipoJornada,
      required this.descripcion,
      required this.idUsuario,
      required this.estatus,
      required this.fecha,
      required this.correoContacto});
}

class Puesto with ChangeNotifier {
  List<PuestoItem> _puestoItems = [];

  // Map<String, PuestoItem> _puestoItems = {};

  Future<void> addPuestoItem(PuestoItem puestoitem) async {
    final url = Uri.parse('http://45.35.64.173:9095/api/Puestos');

    try {
      final response = await http.post(url,
          body: json.encode({
            // "compañia": puestoitem.compania,
            // "idTipoJornada": 0,
            // "logo": "url",
            // "url": "url",
            // "posicion": puestoitem.posicion,
            // "ubicacion": puestoitem.ubicacion,
            // "idCategoria": 0,
            // "descripcion": puestoitem.descripcion,
            // "correoContacto": "correo",
            // "idUsuario": 10,
            // "fecha": puestoitem.fecha

            "compañia": puestoitem.compania,
            "idTipoJornada": puestoitem.idTipoJornada,
            "logo": "url",
            "url": "url",
            "posicion": puestoitem.posicion,
            "ubicacion": puestoitem.ubicacion,
            "idCategoria": 1,
            "descripcion": puestoitem.descripcion,
            "correoContacto": "correo",
            "idUsuario": 2,
            "fecha": DateTime.now().toIso8601String()
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });

      final newPuestoItem = PuestoItem(
          idPuesto: puestoitem.idPuesto,
          compania: puestoitem.compania,
          posicion: puestoitem.posicion,
          ubicacion: puestoitem.ubicacion,
          idCategoria: puestoitem.idCategoria,
          idTipoJornada: puestoitem.idTipoJornada,
          descripcion: puestoitem.descripcion,
          idUsuario: puestoitem.idUsuario,
          estatus: puestoitem.estatus,
          fecha: puestoitem.fecha,
          correoContacto: '');

      _puestoItems.add(newPuestoItem);
    } catch (error) {
      print(error);
      throw error;
    }

    notifyListeners();
  }

  Future<void> updateProduct(String id, PuestoItem newPuestoItem) async {
    final puestoIndex =
        _puestoItems.indexWhere((element) => element.idPuesto == id);

    if (puestoIndex >= 0) {
      final url = Uri.parse('');
      await http.patch(url,
          body: json.encode({
            'idPuesto': newPuestoItem.idPuesto,
            'compania': newPuestoItem.compania,
            'posicion': newPuestoItem.posicion,
            'ubicacion': newPuestoItem.ubicacion,
            'idCategoria': newPuestoItem.idCategoria,
            'idTipoJornada': newPuestoItem.idTipoJornada,
            'descripcionPuesto': newPuestoItem.descripcion,
            'idUsuario': newPuestoItem.idUsuario,
            'estatus': newPuestoItem.estatus,
            'fechaCreacion': newPuestoItem.descripcion,
          }));

      _puestoItems[puestoIndex] = newPuestoItem;
      notifyListeners();
    } else {
      print('El indice no existe. imposible modificar, por favor revisar. ');
    }
  }

  Future<void> deletePuestoItem(String id) async {
    final url = Uri.parse('');
    final existingPuestoItemIndex =
        _puestoItems.indexWhere((item) => item.idPuesto == id);
    PuestoItem? existingProduct = _puestoItems[existingPuestoItemIndex];
    _puestoItems.removeAt(existingPuestoItemIndex);
    final response = await http.delete(url);
    _puestoItems.removeAt(existingPuestoItemIndex);
    notifyListeners();
    if (response.statusCode >= 400) {
      _puestoItems.insert(existingPuestoItemIndex, existingProduct);
      notifyListeners();
      throw HttpException('No se pudo eliminar el item');
    }
    existingProduct = null;
  }

  Future<void> fetchAndSetPuestoItems() async {
    final url = Uri.parse('');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<PuestoItem> loadedProducts = [];
      extractedData.forEach((puestoitemid, puestoData) {
        loadedProducts.add(PuestoItem(
            idPuesto: puestoitemid,
            compania: puestoData['compania'],
            posicion: puestoData['posicion'],
            ubicacion: puestoData['ubicacion'],
            idCategoria: puestoData['idcategoria'],
            idTipoJornada: puestoData['idtipoJornada'],
            descripcion: puestoData['descripcionPuesto'],
            idUsuario: puestoData['idUsuario'],
            estatus: puestoData['estatis'],
            fecha: puestoData['fechaCreacion'],
            correoContacto: ''));
      });

      _puestoItems = loadedProducts;
      notifyListeners();

      print(json.decode(response.body));
    } catch (error) {
      print("Tienes un error en fetch and set este es el detalle: $error");
      throw error;
    }
  }
}

Map<String, PuestoItem> get _puestoItems {
  return {..._puestoItems};
}
