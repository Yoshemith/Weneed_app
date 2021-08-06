import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weneed/page6.dart';

class Page5a extends StatefulWidget {
  Page5a({Key key}) : super(key: key);

  @override
  _Page5aState createState() => _Page5aState();
}

class _Page5aState extends State<Page5a> {
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
  //Set<int> _selected = Set(); //Guarda el contexto del listview add/remove
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //WENEED LOGO ON TOP SCREEN
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/logo/Logo.png',
            fit: BoxFit.contain, height: 45),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "\n¿Que necesitas1? \n",
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
                data: Theme.of(context)
                    .copyWith(highlightColor: Colors.grey.shade900),
                child: Scrollbar(
                  controller: _scrollController,
                  isAlwaysShown: true, //MUESTRA SCROLLBAR
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.only(right: 10.0),
                    itemCount: habilidad.length, //tamaño de lista
                    itemBuilder: (BuildContext context, int index) {
                      final habil = habilidad[index]; //item/index pasa a habil
                      /*return new Card(
                        child: new Container(
                          //height: 60.0,
                          child: new Column(children: <Widget>[
                            new ListTile(
                              title: Text(
                                habil,
                                style: TextStyle(
                                  //color: Color(0xff727F89),
                                  fontSize: 15.0,
                                  //height: 0.9
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  //condicion que verifica que el item
                                  //seleccionado sea el mismo a deseleccionar
                                  if (selectedItems.contains(habil)) {
                                    selectedItems.remove(habil);
                                    print("Remove: " + habil);
                                  } else {
                                    selectedItems.add(habil);
                                    print("Add: " + habil);
                                  }
                                });
                              },
                              //Aqui se produce el cambio de icono por la condicion
                              //verifica que este selccionado
                              trailing: ((selectedItems.contains(habil))
                                  ? Align(
                                      child: Icon(Icons.check,
                                          color: Colors.greenAccent[400]),
                                      alignment: FractionalOffset.centerRight,
                                    )
                                  : Icon(null)),
                            )
                          ]),
                        ),
                      );*/
                      return Container(
                        height: 48.0,
                        child: Card(
                          child: ListTile(
                            tileColor: Color(0xff2C2E35),
                            /*title: Text(
                              habil, //toma nombre del item/index en contexto,
                              style: TextStyle(
                                  color: Color(0xff727F89),
                                  fontSize: 15.0,
                                  height: 0.9),
                            ),*/
                            //FIXED TEXT TITLE OF LIST ***********************************
                            title: Column(
                              children: <Widget>[
                                SizedBox(
                                  width: 160,
                                  child: Align(
                                    child: Text(
                                      habil, //toma nombre del item/index en contexto,
                                      style: TextStyle(
                                          color: Color(0xff727F89),
                                          fontSize: 15.0,
                                          height: 0.9),
                                    ),
                                    alignment: Alignment
                                        .centerLeft, //FractionalOffset.centerLeft,
                                  ),
                                ),
                              ],
                            ),
                            //contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                            onTap: () {
                              setState(() {
                                //condicion que verifica que el item
                                //seleccionado sea el mismo a deseleccionar
                                if (selectedItems.contains(habil)) {
                                  selectedItems.remove(habil);
                                  print("Remove: " + habil);
                                } else {
                                  selectedItems.add(habil);
                                  print("Add: " + habil);
                                }
                              });
                            },
                            //Aqui se produce el cambio de icono por la condicion
                            //verifica que este selccionado
                            trailing: ((selectedItems.contains(habil))
                                ? Align(
                                    child: SizedBox(
                                      width: 30,
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.greenAccent[400],
                                        //size: 15,
                                      ),
                                    ),
                                    alignment: Alignment
                                        .centerRight, //FractionalOffset.centerRight,
                                  )
                                : Icon(null)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            //BOTON CONTINUAR
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Directionality(
                textDirection: TextDirection.rtl, //Indica lado del texto(left)
                child: RaisedButton.icon(
                    color: Color(0xffe8ca4d),
                    padding: EdgeInsets.symmetric(horizontal: 25), //boton largo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      //CLICK Y PASA AL SCREEN 6
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => Page6()),
                      );
                      print("Boton Continuar ->");
                      print(
                          selectedItems); //Imprime la lista de los seleccionados
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black, size: 18),
                    label: Text("Continuar",
                        style: TextStyle(fontSize: 15, color: Colors.black))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
