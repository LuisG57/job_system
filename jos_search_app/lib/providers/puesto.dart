// To parse this JSON data, do
//
//     final puesto = puestoFromJson(jsonString);

// import 'dart:convert';

// Puesto puestoFromJson(String str) => Puesto.fromJson(json.decode(str));

// String puestoToJson(Puesto data) => json.encode(data.toJson());

// class Puesto {
//   Puesto({
//     required this.compaia,
//     required this.idTipoJornada,
//     required this.logo,
//     required this.url,
//     required this.posicion,
//     required this.ubicacion,
//     required this.idCategoria,
//     required this.descripcion,
//     required this.correoContacto,
//     required this.idUsuario,
//     required this.fecha,
//   });

//   String compaia;
//   int idTipoJornada;
//   String logo;
//   String url;
//   String posicion;
//   String ubicacion;
//   int idCategoria;
//   String descripcion;
//   String correoContacto;
//   int idUsuario;
//   DateTime fecha;

//   factory Puesto.fromJson(Map<String, dynamic> json) => Puesto(
//         compaia: json["compañia"],
//         idTipoJornada: json["idTipoJornada"],
//         logo: json["logo"],
//         url: json["url"],
//         posicion: json["posicion"],
//         ubicacion: json["ubicacion"],
//         idCategoria: json["idCategoria"],
//         descripcion: json["descripcion"],
//         correoContacto: json["correoContacto"],
//         idUsuario: json["idUsuario"],
//         fecha: DateTime.parse(json["fecha"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "compañia": compaia,
//         "idTipoJornada": idTipoJornada,
//         "logo": logo,
//         "url": url,
//         "posicion": posicion,
//         "ubicacion": ubicacion,
//         "idCategoria": idCategoria,
//         "descripcion": descripcion,
//         "correoContacto": correoContacto,
//         "idUsuario": idUsuario,
//         "fecha": fecha.toIso8601String(),
//       };
// }

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exceptions.dart';

class PuestoItem {
  final int? idPuesto; // no hay
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
            'compañia': newPuestoItem.compania,
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
    final url =
        Uri.parse('http://45.35.64.173:9095/api/Puestos?page=1&rows=20');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<PuestoItem> loadedProducts = [];
      print('Primer print $extractedData');
      print('Segundo print ${extractedData['position']}');
      print('tercer print ${extractedData['collection']}');
      print('cuarto print ${extractedData['collection'] as List}');
      var lista = extractedData['collection'] as List;
      Map<int, dynamic> mapa = {}; //empty map
      for (var i in lista) {
        // print('${i}\n');
        var j = i as Map<String, dynamic>;
        print('${j['posicion']}\n');
        mapa.putIfAbsent(j['idPuesto'], () {
          return j;
        });
      }

      mapa.forEach((idPuesto, puestoData) {
        print(idPuesto);
        loadedProducts.add(PuestoItem(
            idPuesto: int.parse(mapa[idPuesto]['idPuesto']),
            compania: mapa[idPuesto]['compañia'],
            posicion: mapa[idPuesto]['tipoJornada'],
            ubicacion: mapa[idPuesto]['logo'],
            idCategoria: int.parse(mapa[idPuesto]['url']),
            idTipoJornada: 0,
            descripcion: mapa[idPuesto][''],
            idUsuario: 0,
            estatus: '1',
            fecha: mapa[idPuesto][''],
            correoContacto: mapa[idPuesto]['']));
      });

      _puestoItems = loadedProducts;
      print(_puestoItems.first.posicion);
      print(extractedData);
      notifyListeners();

      // print(json.decode(response.body));
    } catch (error) {
      print("Tienes un error en fetch and set este es el detalle: $error");
      throw error;
    }
  }
}

Map<String, PuestoItem> get _puestoItems {
  return {..._puestoItems};
}
