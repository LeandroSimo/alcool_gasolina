import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _textoResultado = "";

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precogasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precogasolina == null) {
      setState(() {
        _textoResultado =
            'Número inválido, digite números maiores que 0 utlizando o (.) para separá-los';
      });
    } else {
      if (precoAlcool / precogasolina >= 0.7) {
        setState(() {
          _textoResultado = 'Melhor abastecer com Gasolina';
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com Álcool";
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Álcool ou Gasolina',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  Image.asset('images/logo.png'),
                  Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 25),
                    child: Text(
                      'Saiba qual a melhor opção para abastecimento do seu carro!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Preço Álcool: 1.59',
                      labelStyle: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    controller: _controllerAlcool,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Preço Gasolina: 3.15',
                      labelStyle: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    controller: _controllerGasolina,
                  )
                ],
              ),
            ),
            RaisedButton(
              padding:
                  EdgeInsets.only(top: 10, left: 80, right: 80, bottom: 10),
              child: Text(
                'Calcular',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Colors.blue[900],
              onPressed: _calcular,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
