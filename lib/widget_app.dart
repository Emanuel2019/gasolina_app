import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String name = "Gasolina ou Gasoléo?";
  GlobalKey<FormState> _fomkey = GlobalKey<FormState>();
  TextEditingController gasolinaController = TextEditingController();
  TextEditingController gasoleoController = TextEditingController();
 String text = "Informa o valor de cada combustivel";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                resetar();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: Form(
          key: _fomkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.directions_car,
                size: 60.0,
                color: Colors.orange,
              ),
              buildFormGasolina(),
              buildFormGasoleo(),
              buildButton(context),
              buildText(),
            ],
          ),
        ),
      ),
    );
  }

  buildFormGasolina() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Preço da Gasolina",
          labelStyle: TextStyle(color: Colors.black, fontSize: 30.0)),
      controller: gasolinaController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe o valor do gasolina';
        }
      },
    );
  }

  buildFormGasoleo() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Preço da Gasoléo",
          labelStyle: TextStyle(color: Colors.black, fontSize: 30.0)),
      controller: gasoleoController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe o valor do Gasoléo';
        }
      },
    );
  }

  buildButton(BuildContext context) {
    return Container(
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          if (_fomkey.currentState!.validate()) {
            Calcular();
            FocusScope.of(context).requestFocus(new FocusNode());
          }
        },
        child: Text(
          'Calcular',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            )),
      ),
    );
  }

  buildText() {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    );
  }

  void Calcular() {
    setState(() {
      double gasolina = double.parse(gasolinaController.text);
    double gasoleo = double.parse(gasoleoController.text);
    double result = (gasoleo / gasolina);
    if (result > 0.70) {
      text =
          "Percentual:(${result.toStringAsPrecision(3)})\n Vale a pena abascetecer com Gasolina";
    } else {
      text =
          "Percentual:(${result.toStringAsPrecision(3)})\n Vale a pena abascetecer com Gasoléo";
    }
    });
  }

  resetar() {
   setState(() {
      gasoleoController.text = "";
    gasolinaController.text = "";
    text = "Informa o valor de cada combustivel";
   });
  }
}
