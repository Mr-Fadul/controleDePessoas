import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        title: 'Controle de pessoas',
        home: Home(),
      ),
  );
} 

class Home extends StatefulWidget { 
  @override
  _HomeState createState () => _HomeState();

}
class _HomeState extends State<Home>{
  int _qtdePessoas=0;
  String _message="";
  void _changeQtdePessoas(int  variante){
    setState(() {
      _qtdePessoas += variante;
      _changeMessage();
    });
  }

  void _changeMessage(){
    if(_qtdePessoas == 0){
      _message = "Sala vazia";
    }
    if(_qtdePessoas <= 5 && _qtdePessoas > 0){
      _message="Pode entrar";
    }else{
      _message="Sala Cheia";
    }

  }

  @override
  Widget build(BuildContext context) {
    return(
      Stack(
        children: <Widget>[
          Image.asset(
            "img/shopping.jpg", fit: BoxFit.fill, height: 1000.0,      
          ),
           Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Pessoas: $_qtdePessoas",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.2),
            child: FlatButton(
              child: Text(
                "+1",
                style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                debugPrint("+1");
                _changeQtdePessoas(1);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.2),
            child: FlatButton(
              child: Text("-1", style: TextStyle(fontSize: 35.0, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                debugPrint("-1");
                _changeQtdePessoas(-1);
              },
            ),
          ),
        ]),
        Text(
          _message,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    )
        ],
      )
    );
  }
}
