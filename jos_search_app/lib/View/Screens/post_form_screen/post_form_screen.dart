import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Widgets/gradient_background/gradient_background.dart';

class PostFormScreen extends StatelessWidget {
  const PostFormScreen({Key? key}) : super(key: key);
  static const routeName = '/post-form-screen';

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
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 300,
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Posición'),
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
                                DropdownMenuItem(
                                  child: Text('Categoria'),
                                ) //we need to figure out how to include more than one dropdown item
                              ],
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
                                DropdownMenuItem(
                                  child: Text('Tipo de Jornada'),
                                ) //we need to figure out how to include more than one dropdown item
                              ],
                              decoration:
                                  InputDecoration(hintText: 'Tipo de Jornada'),
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
                              onPressed: () {},
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
