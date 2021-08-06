import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weneed/history.dart';
import 'package:weneed/page7.dart';
import 'package:weneed/page8.dart';
import 'package:weneed/support.dart';

class Page6 extends StatefulWidget {
  Page6({Key key}) : super(key: key);

  @override
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  String valueChoosePais; //Pais a seleccionar
  String valueChooseCiudad; //Ciudad a seleccionar
  List listPaises = ["Mexico", "Colombia", "Rusia", "Francia", "Suecia"];
  List listCiudad = [
    "Puebla",
    "Guadalajara",
    "Monterrey",
    "Merida",
    "Acapulco"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //LOGO ON TOP SCREEN
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
                leading: Icon(Icons.support, color: Color(0xffE8CA4D)),
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
                leading: Icon(Icons.logout, color: Color(0xffE8CA4D)),
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
            Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 80.0),
              height: 200.0,
              child: Text(
                "¿Donde?",
                style: TextStyle(fontSize: 25, color: Color(0xffe8ca4d)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Color(0Xff2C2E35), //color del click
                ),
                child: DropdownButtonHideUnderline(
                  //este fuera del container
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    width: 220,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0Xff2C2E35),
                    ),
                    child: DropdownButton(
                      hint: Text(
                        "País ",
                        style: TextStyle(color: Color(0Xff727F89)),
                      ),
                      iconSize: 40,
                      iconEnabledColor: Colors.black,
                      value: valueChoosePais, //guarda valor de seleccion
                      onChanged: (newValue) {
                        setState(() {
                          //Cada que selecciona un pais cambia de valor
                          //cambia valor de seleccion anuevo valor
                          valueChoosePais = newValue;
                        });
                      },
                      items: listPaises.map((valueItem) {
                        //mapeo de valores
                        return DropdownMenuItem(
                          value: valueItem, //los valores de la lista Paises
                          child: Text(valueItem), //muestra los valores
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Color(0Xff2C2E35), //color del click
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  width: 220,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0Xff2C2E35),
                  ),
                  child: DropdownButtonHideUnderline(
                    //este dentro del container
                    child: DropdownButton(
                      hint: Text(
                        "Ciudad ",
                        style: TextStyle(color: Color(0Xff727F89)),
                      ),
                      iconSize: 40,
                      iconEnabledColor: Colors.black,
                      value: valueChooseCiudad, //guarda valor de seleccion
                      onChanged: (newValue) {
                        setState(() {
                          //Cada que selecciona un pais cambia de valor
                          //cambia valor de seleccion anuevo valor
                          valueChooseCiudad = newValue;
                        });
                      },
                      items: listCiudad.map((valueItem) {
                        //mapeo de valores
                        return DropdownMenuItem(
                          value: valueItem, //los valores de la lista Paises
                          child: Text(valueItem), //muestra los valores
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            //BOTON CONTINUAR
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Directionality(
                textDirection: TextDirection.rtl, //Indica lado del texto(left)
                child: RaisedButton.icon(
                    color: Color(0xffe8ca4d),
                    padding: EdgeInsets.symmetric(horizontal: 30), //boton largo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      //CLICK Y AVANZA A PAGE7
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => Page7()),
                      );
                      print("Boton Continuar ->");
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
