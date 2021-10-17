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
  UserItem(
      {required this.idUsuario,
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
      required this.uniqueId});
}
