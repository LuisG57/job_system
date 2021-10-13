import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Usuario {
  final int idUsuario;
  final String nombre;
  final String apellido;
  final String idTipoUsuario;
  final String clave;
  final String correo;
  final bool estatus;
  final DateTime fechaCreacion;
  final int idCategoria;
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
