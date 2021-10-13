import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exceptions.dart';

class PuestoItem {
  final String idPuesto;
  final String compania;
  final String posicion;
  final String ubicacion;
  final String idCategoria;
  final String idTipoJornada;
  final String descripcionPuesto;
  final String idUsuario;
  final String estatus;
  final String fechaCreacion;

  PuestoItem(
      {required this.idPuesto,
      required this.compania,
      required this.posicion,
      required this.ubicacion,
      required this.idCategoria,
      required this.idTipoJornada,
      required this.descripcionPuesto,
      required this.idUsuario,
      required this.estatus,
      required this.fechaCreacion});
}

class Puesto with ChangeNotifier {
  List<PuestoItem> _puestoItems = [];

  // Map<String, PuestoItem> _puestoItems = {};

  Future<void> addPuestoItem(PuestoItem puestoitem) async {
    final url = Uri.parse('');

    try {
      final response = await http.post(url,
          body: json.encode({
            'idPuesto': puestoitem.idPuesto,
            'compania': puestoitem.compania,
            'posicion': puestoitem.posicion,
            'ubicacion': puestoitem.ubicacion,
            'idCategoria': puestoitem.idCategoria,
            'idTipoJornada': puestoitem.idTipoJornada,
            'descripcionPuesto': puestoitem.descripcionPuesto,
            'idUsuario': puestoitem.idUsuario,
            'estatus': puestoitem.estatus,
            'fechaCreacion': puestoitem.fechaCreacion
          }));

      final newPuestoItem = PuestoItem(
          idPuesto: puestoitem.idPuesto,
          compania: puestoitem.compania,
          posicion: puestoitem.posicion,
          ubicacion: puestoitem.ubicacion,
          idCategoria: puestoitem.idCategoria,
          idTipoJornada: puestoitem.idTipoJornada,
          descripcionPuesto: puestoitem.descripcionPuesto,
          idUsuario: puestoitem.idUsuario,
          estatus: puestoitem.estatus,
          fechaCreacion: puestoitem.fechaCreacion);

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
            'descripcionPuesto': newPuestoItem.descripcionPuesto,
            'idUsuario': newPuestoItem.idUsuario,
            'estatus': newPuestoItem.estatus,
            'fechaCreacion': newPuestoItem.fechaCreacion,
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
            descripcionPuesto: puestoData['descripcionPuesto'],
            idUsuario: puestoData['idUsuario'],
            estatus: puestoData['estatis'],
            fechaCreacion: puestoData['fechaCreacion']));
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
