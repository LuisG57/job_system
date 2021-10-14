import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background.dart';
import 'package:jos_search_app/providers/puesto.dart';
import 'package:jos_search_app/providers/usuario.dart';
import 'package:provider/provider.dart';

class PostFormScreen extends StatefulWidget {
  const PostFormScreen({Key? key}) : super(key: key);
  static const routeName = '/post-form-screen';

  @override
  State<PostFormScreen> createState() => _PostFormScreenState();
}

class _PostFormScreenState extends State<PostFormScreen> {
  final formKey = GlobalKey<FormState>();

  var nuevoPuesto = PuestoItem(
      idPuesto: '0',
      compania: '',
      posicion: '',
      ubicacion: '',
      idCategoria: 0,
      idTipoJornada: 0,
      descripcion: '',
      idUsuario: 0,
      estatus: '',
      correoContacto: '',
      fecha: DateTime.now().toIso8601String());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBackGround(),
          //Extract widget later ----*----*----
          Center(
            child: Container(
              height: 675,
              width: 1400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.lightBlueAccent, Colors.greenAccent],
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Image.asset(
                    'images/post_form_icon.png',
                    height: 400,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
              ),
              Container(
                height: 750,
                width: 950,
                color: Colors.white,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 35.0),
                        child: Text(
                          'Publicar oferta de trabajo',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              height: 0.9,
                              fontSize: 48),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Compañia'),
                              textInputAction: TextInputAction.next,
                              onSaved: (valor) => nuevoPuesto = PuestoItem(
                                  idPuesto: '0',
                                  compania: valor,
                                  posicion: nuevoPuesto.posicion,
                                  ubicacion: nuevoPuesto.ubicacion,
                                  idCategoria: nuevoPuesto.idCategoria,
                                  idTipoJornada: nuevoPuesto.idTipoJornada,
                                  descripcion: nuevoPuesto.descripcion,
                                  idUsuario: nuevoPuesto.idUsuario,
                                  estatus: nuevoPuesto.estatus,
                                  fecha: nuevoPuesto.fecha,
                                  correoContacto: nuevoPuesto.correoContacto),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 300,
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Posición'),
                              textInputAction: TextInputAction.next,
                              onSaved: (valor) => nuevoPuesto = PuestoItem(
                                  idPuesto: '0',
                                  compania: nuevoPuesto.compania,
                                  posicion: valor,
                                  ubicacion: nuevoPuesto.ubicacion,
                                  idCategoria: nuevoPuesto.idCategoria,
                                  idTipoJornada: nuevoPuesto.idTipoJornada,
                                  descripcion: nuevoPuesto.descripcion,
                                  idUsuario: nuevoPuesto.idUsuario,
                                  estatus: nuevoPuesto.estatus,
                                  fecha: nuevoPuesto.fecha,
                                  correoContacto: nuevoPuesto.correoContacto),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            child: DropdownButtonFormField(
                              items: [
                                DropdownMenuItem<String>(
                                  child: Text('Programacion'),
                                  value: '1',
                                ), //we need to figure out how to include more than one dropdown item
                                DropdownMenuItem<String>(
                                  child: Text('Diseño'),
                                  value: '2',
                                )
                              ],
                              onTap: () {},
                              onChanged: (value) {},
                              decoration:
                                  InputDecoration(hintText: 'Categoria'),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 300,
                            child: DropdownButtonFormField(
                              items: [
                                DropdownMenuItem<String>(
                                  child: Text('Full time'),
                                  value: '1',
                                ), //we need to figure out how to include more than one dropdown item
                                DropdownMenuItem<String>(
                                  child: Text('Part time'),
                                  value: '2',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Freelance'),
                                  value: '3',
                                )
                              ],
                              decoration:
                                  InputDecoration(hintText: 'Tipo de Jornada'),
                              onSaved: (value) {
                                int valor = 2;
                                if (value == '1') {
                                  valor = 1;
                                }
                                if (value == '2') {
                                  valor = 2;
                                }
                                if (value == '3') {
                                  valor = 3;
                                }
                                nuevoPuesto = PuestoItem(
                                    idPuesto: '0',
                                    compania: nuevoPuesto.compania,
                                    posicion: nuevoPuesto.posicion,
                                    ubicacion: nuevoPuesto.ubicacion,
                                    idCategoria: nuevoPuesto.idCategoria,
                                    idTipoJornada: valor,
                                    descripcion: nuevoPuesto.descripcion,
                                    idUsuario: nuevoPuesto.idUsuario,
                                    estatus: nuevoPuesto.estatus,
                                    fecha: nuevoPuesto.fecha,
                                    correoContacto: nuevoPuesto.correoContacto);
                              },
                              onTap: () {},
                              onChanged: (value) {
                                setState(() {
                                  int valor = 0;
                                  if (value == 1) {
                                    valor = 1;
                                  }
                                  if (value == 2) {
                                    valor = 2;
                                  }
                                  if (value == 3) {
                                    valor = 3;
                                  }

                                  nuevoPuesto = PuestoItem(
                                      idPuesto: '0',
                                      compania: nuevoPuesto.compania,
                                      posicion: nuevoPuesto.posicion,
                                      ubicacion: nuevoPuesto.ubicacion,
                                      idCategoria: nuevoPuesto.idCategoria,
                                      idTipoJornada: valor,
                                      descripcion: nuevoPuesto.descripcion,
                                      idUsuario: nuevoPuesto.idUsuario,
                                      estatus: nuevoPuesto.estatus,
                                      fecha: nuevoPuesto.fecha,
                                      correoContacto:
                                          nuevoPuesto.correoContacto);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 625,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(hintText: 'Ubicación'),
                              textInputAction: TextInputAction.next,
                              onSaved: (valor) => nuevoPuesto = PuestoItem(
                                  idPuesto: '0',
                                  compania: nuevoPuesto.compania,
                                  posicion: nuevoPuesto.posicion,
                                  ubicacion: valor,
                                  idCategoria: nuevoPuesto.idCategoria,
                                  idTipoJornada: nuevoPuesto.idTipoJornada,
                                  descripcion: nuevoPuesto.descripcion,
                                  idUsuario: nuevoPuesto.idUsuario,
                                  estatus: nuevoPuesto.estatus,
                                  fecha: nuevoPuesto.fecha,
                                  correoContacto: nuevoPuesto.correoContacto),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          width: 625,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Descripcion...',
                                border: OutlineInputBorder()),
                            textInputAction: TextInputAction.next,
                            onSaved: (valor) => nuevoPuesto = PuestoItem(
                                idPuesto: '0',
                                compania: nuevoPuesto.compania,
                                posicion: nuevoPuesto.posicion,
                                ubicacion: nuevoPuesto.ubicacion,
                                idCategoria: nuevoPuesto.idCategoria,
                                idTipoJornada: nuevoPuesto.idTipoJornada,
                                descripcion: valor,
                                idUsuario: nuevoPuesto.idUsuario,
                                estatus: nuevoPuesto.estatus,
                                fecha: nuevoPuesto.fecha,
                                correoContacto: nuevoPuesto.correoContacto),
                            maxLines: 6,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                formKey.currentState?.save();
                                final provedor =
                                    Provider.of<Puesto>(context, listen: false);
                                provedor.addPuestoItem(nuevoPuesto);

                                Navigator.pushNamed(context, '/');
                              },
                              child: Text('Publicar'),
                              style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(Size(175, 50)),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Cancelar'),
                              style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(Size(175, 50)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
