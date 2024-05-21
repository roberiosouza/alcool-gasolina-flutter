import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  const AlcoolGasolina({super.key});

  @override
  State<AlcoolGasolina> createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  TextEditingController _alcoolController = TextEditingController();
  TextEditingController _gasolinaController = TextEditingController();
  String _resultado = "";
  bool _error = false;

  void _calcular() {
    double precoAlcool = double.tryParse(_alcoolController.text) ?? 0;
    double precoGasolina = double.tryParse(_gasolinaController.text) ?? 0;

    if (precoAlcool == 0 || precoGasolina == 0) {
      setState(() {
        _error = true;
        _resultado =
            "Informe um valor válido maior que zero e use (.) ao invés de (,).";
      });
    } else {
      if (precoAlcool / precoGasolina > 0.7) {
        setState(() {
          _error = false;
          _resultado = "Melhor abastecer com Gasolina.";
        });
      } else {
        setState(() {
          _error = false;
          _resultado = "Melhor abastecer com Álcool.";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou Gasolina",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("images/logo.png"),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Saiba qual melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Álcool, ex: 1.59"),
                  controller: _alcoolController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Gasolina, ex: 3.15"),
                  controller: _gasolinaController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _calcular();
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      shape: ContinuousRectangleBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _resultado,
                    style: (_error)
                        ? TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.red)
                        : TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
