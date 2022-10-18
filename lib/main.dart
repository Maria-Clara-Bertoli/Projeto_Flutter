import 'package:flutter/material.dart';
import 'package:segundo_projeto/Campo.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: AppImplement()
    );
  }
}
class AppImplement extends StatefulWidget{
  AppImplement({Key? key}) : super(key: key);
  @override 
  _AppImplementState createState() => _AppImplementState();
}

class _AppImplementState extends State<AppImplement>{

  double tipodouble = 0;
  int tipoint = 0;
  String tipostring = "";

  Campo campo = new Campo();
  final TextEditingController _controllercampodouble = TextEditingController();
  final TextEditingController _controllercampoint = TextEditingController();
  final TextEditingController _controllercampostring = TextEditingController();

   @override 
    void initState(){
       super.initState();
      _pegaDispositivo();
      setState(() { 
      });   
  }

  _pegaDispositivo() async{
    SharedPreferences prefs = await
    SharedPreferences.getInstance();
    setState((){
    tipodouble = (prefs.getDouble('dub') ?? 0);
    tipoint = (prefs.getInt('int') ?? 0);
    tipostring = (prefs.getString('str') ?? "");
    });
  }

  void _salvaDispositivo() async{
    SharedPreferences prefs = await
    SharedPreferences.getInstance();
    setState(() {
      prefs.setDouble('dub', tipodouble);
      prefs.setInt('int', tipoint);
      prefs.setString('str', tipostring);
    });
  }

  @override
  Widget build(BuildContext context){ 
  return MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(children: [
            Text(
              "DOUBLE",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.deepPurple),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: _controllercampodouble, 
                  decoration: InputDecoration(hintText: "Informe um valor do tipo double", 
                  border: OutlineInputBorder(),
                  ),
                ),
              ),
              Text(
              "INTEIRO",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.deepPurple),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: _controllercampoint, 
                  decoration: InputDecoration(hintText: "Informe um valor do tipo inteiro", 
                  border: OutlineInputBorder(),
                  ),
                ),
              ),
              Text(
              "STRING",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.deepPurple),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: _controllercampostring, 
                  decoration: InputDecoration(hintText: "Informe um valor do tipo string", 
                  border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text('ENVIAR',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 40),
                  primary: Colors.deepPurple,
                  onPrimary: Colors.white,
                ),  
                onPressed: (){
                  setState(() {
                    final double? campodouble = double.tryParse(_controllercampodouble.text);
                    final int? campoint = int.tryParse(_controllercampoint.text);
                    final String? campostr = _controllercampostring.text;

                    campo.setCampoDouble(campodouble!);
                    campo.setCampoInt(campoint!);
                    campo.setCampoStr(campostr!);

                    tipodouble = campo.getCampoDouble();
                    tipoint = campo.getCampoInt();
                    tipostring = campo.getCampoStr();

                    _salvaDispositivo(); 
                    
                  }
                );
              },
            ),
            Text(""),
            Text(
              "DOUBLE: " + tipodouble.toString() + " INTEIRO: " + tipoint.toString() + " STRING: " + tipostring,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.deepPurple),
            ),
            //_pegaDispositivo(),
          ],)
        )
      ),
    );
  }
}
