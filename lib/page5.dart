import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weneed/page6.dart';
import 'package:weneed/page8.dart';
import 'package:weneed/support.dart';
import 'package:weneed/history.dart';

class Page5 extends StatefulWidget {
  Page5({Key key}) : super(key: key);

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  //Lista simple de habilidades
  List<String> habilidad = [
    "Arreglo de manos y pies",
    "Asesores de imagen",
    "Asesoria Legal",
    "Cantantes",
    "Carpintería",
    "Cerrajería",
    "Clases de baile",
    "Clases de bajo",
    "Clases de batería",
    "Clases de canto",
    "Clases de guitarra",
    "Clases de ingles",
    "Clases de matematicas",
    "Clases de piano",
    "Control de plagas",
    "Cuidador de abuelos",
    "Cuidador de niños",
    "Cuidados personas con discapacidad",
    "Decoraciones de fiestas",
    "Decorador de interior",
    "Electricista",
    "Estilistas",
    "Floristería",
    "Fotografía",
    "Grupos musicales",
    "Limpieza de muebles",
    "Limpieza empresas",
    "Limpieza hogar",
    "Maestro de obra",
    "Maquillaje",
    "Mecánica de carros",
    "Mecánica de motos",
    "Mensajeros",
    "Ornamentador",
    "Pintor de automóviles",
    "Pintor de casas",
    "Plomero",
    "Recreacionistas",
    "Revisión de computadores",
    "Revisión de lavadoras",
    "Revisión de neveras",
    "Sonidos y Luces",
    "Técnico celulares",
    "Técnico de bicicletas",
    "Veterinarios",
    "Video y edición"
  ];

  final _scrollController = ScrollController(); //Controlador a usar
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    //willPopScope inhabilita el back del boton de android (Del telefono)
    return WillPopScope(
      onWillPop: () {
        return showCupertinoDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: AlertDialog(
                  title: Row(
                    children: [
                      Icon(Icons.error, color: Colors.red),
                      Text(" Confirmar ")
                    ],
                  ), //Confirm Exit
                  content: Text(
                      "¿Esta seguro de salir de la aplicacion?"), //Are you sure you want to exit?
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Si"),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                    FlatButton(
                      child: Text("No"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              );
            });
        //return Future.value(true);  //--> Dead code
      },
      //onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        //WENEED LOGO ON TOP SCREEN
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.asset('assets/logo/Logo.png',
              fit: BoxFit.contain, height: 45),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/logo/Cliente.png',
                fit: BoxFit.fill,
                height: 10,
              ),
            ),
          ],
        ),
        //MENU DEL USUARIO (SWITCH-HISTORY-SOPORTE-LOGOUT)
        drawer: Theme(
          //color del tema del listview (Switch, history, support)
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.black.withOpacity(0.90)),
          child: new Drawer(
            child: ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  //decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)), //color de la parte user
                  accountName: Text("Username",
                      style: TextStyle(color: Color(0xffE8CA4D))),
                  accountEmail: Text("User@email.com"),
                  currentAccountPicture: new CircleAvatar(
                    //Aqui va la imagen del usuario
                    child: new Image.asset('assets/logo/Cliente.png'),
                    //backgroundImage: new NetworkImage('http:link de la imagen')
                  ),
                ),
                //BOTON SWITCH
                new ListTile(
                  leading: Icon(Icons.swap_horiz, color: Color(0xffE8CA4D)),
                  title: Text("Switch"),
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => Page8()));
                    print("Boton switch");
                  },
                ),
                Divider(
                  color: Colors.white24,
                  height: 0.1,
                ),
                //BOTON HISTORIAL
                new ListTile(
                  leading: Icon(Icons.history, color: Color(0xffE8CA4D)),
                  title: Text("Historial"),
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => History()));
                    print("Boton Historial");
                  },
                ),
                Divider(
                  color: Colors.white24,
                  height: 0.1,
                ),
                //BOTON SOPORTE
                new ListTile(
                  leading: Icon(Icons.help, color: Color(0xffE8CA4D)),
                  title: Text("Soporte"),
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => Support()));
                    print("Boton Soporte");
                  },
                ),
                Divider(
                  color: Colors.white24,
                  height: 0.1,
                ),
                //NEW LOGOUT BUTTON AGREGADO ***********************************
                //BOTON LOGOUT
                new ListTile(
                  leading: Icon(Icons.exit_to_app, color: Color(0xffE8CA4D)),
                  title: Text("Log Out"),
                  onTap: () {
                    print("Boton Log Out");
                  },
                ),
                Divider(
                  color: Colors.white24,
                  height: 0.1,
                ),
              ],
            ),
          ),
        ),
        //CONTENIDO DEL SCREEN
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                "\n¿Que necesitas? \n",
                style: TextStyle(fontSize: 26.0, color: Color(0xffE8CA4D)),
              ),
              Text(
                "Dinos que servicios requieres \ny enviaremos la solicitud a cientos \n de técnicos y profesionales.\n",
                style: TextStyle(fontSize: 22.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 250,
                height: 300,
                color: Colors.black,
                child: Theme(
                  //Scrollbar dentro de Theme ha cambiado el color del scrollbar
                  //data: ThemeData(unselectedWidgetColor: Colors.transparent),
                  data: Theme.of(context)
                      .copyWith(highlightColor: Colors.grey.shade900),
                  child: Scrollbar(
                    controller: _scrollController,
                    isAlwaysShown: true, //MUESTRA SCROLLBAR
                    child: Theme(
                      //ListView dentro de Theme cambia el fondo a transparente
                      //Para que la caja del check no se distinga y se vea flawless
                      data:
                          ThemeData(unselectedWidgetColor: Colors.transparent),
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.only(right: 10.0),
                        itemCount: habilidad.length, //tamaño de lista
                        itemBuilder: (BuildContext context, int index) {
                          final habil =
                              habilidad[index]; //item/index pasa a habil
                          return new Card(
                            child: new Container(
                              //padding: new EdgeInsets.only(right: 10.0),
                              //height: 60,
                              color: Color(0xff2C2E35),
                              child: new Column(
                                children: <Widget>[
                                  new CheckboxListTile(
                                    activeColor: Colors.transparent,
                                    checkColor: Colors.greenAccent[400],
                                    title: Text(
                                      habil,
                                      style: TextStyle(
                                        color: Color(0xff727F89),
                                        //color: Color(0xff727F89),
                                        fontSize: 15.0,
                                        //height: 0.9
                                      ),
                                    ),
                                    value: selectedItems.contains(habil),
                                    onChanged: (bool value) {
                                      if (value) {
                                        setState(() {
                                          selectedItems.add(habil);
                                          print("Add: " + habil);
                                        });
                                      } else {
                                        setState(() {
                                          selectedItems.remove(habil);
                                          print("Remove: " + habil);
                                        });
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              //BOTON CONTINUAR
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Directionality(
                  textDirection:
                      TextDirection.rtl, //Indica lado del texto(left)
                  child: RaisedButton.icon(
                      color: Color(0xffe8ca4d),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25), //boton largo
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        //CLICK CHECA SI ESTA VACIO Y MUESTRA ALERTA
                        if (selectedItems.isEmpty) {
                          print("Esta vacio");
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                                child: AlertDialog(
                                  title: Row(
                                    //mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.warning,
                                          color: Color(0xffE8CA4D)),
                                      Text(" Advertencia ")
                                    ],
                                  ),
                                  content:
                                      Text("¡Debe de elegir algun servicio!"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15)),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        print("Boton Ok");
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          //SINO PASA AL SCREEN 6
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Page6()),
                          );
                          print("Boton Continuar ->");
                          print(selectedItems); //Imprime lista de seleccionados
                        }
                      },
                      icon:
                          Icon(Icons.arrow_back, color: Colors.black, size: 18),
                      label: Text("Continuar",
                          style: TextStyle(fontSize: 15, color: Colors.black))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
