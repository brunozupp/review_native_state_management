import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:review_native_state_management/app/pages/widgets/imc_gauge.dart';
    
class SetStatePage extends StatefulWidget {
  const SetStatePage({super.key});

  @override
  State<SetStatePage> createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {

  final _formKey = GlobalKey<FormState>();
  final _pesoEC = TextEditingController();
  final _alturaEC = TextEditingController();

  var imc = 0.0;

  Future<void> _calcularIMC({
    required double peso,
    required double altura,
  }) async {

    setState(() {
      imc = 0;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      imc = peso / pow(altura, 2);
    });
  }

  @override
  void dispose() {
    _pesoEC.dispose();
    _alturaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set State'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ImcGauge(
                imc: imc,
              ),
          
              const SizedBox(
                height: 20,
              ),
          
              TextFormField(
                controller: _pesoEC,
                decoration: const InputDecoration(
                  labelText: "Peso",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter.currency(
                    locale: "pt_BR",
                    symbol: "",
                    decimalDigits: 2,
                    turnOffGrouping: true,
                  ),
                ],
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Peso obrigatório";
                  }

                  return null;
                },
              ),
          
              const SizedBox(
                height: 10,
              ),
          
              TextFormField(
                controller: _alturaEC,
                decoration: const InputDecoration(
                  labelText: "Altura",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter.currency(
                    locale: "pt_BR",
                    symbol: "",
                    decimalDigits: 2,
                    turnOffGrouping: true,
                  ),
                ],
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Altura obrigatório";
                  }

                  return null;
                },
              ),
          
              const SizedBox(
                height: 20,
              ),
          
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                    final formValid = _formKey.currentState?.validate() ?? false;

                    if(formValid) {
                      final formatter = NumberFormat.simpleCurrency(
                        locale: "pt_BR",
                        decimalDigits: 2,
                      );
            
                      double peso = formatter.parse(_pesoEC.text) as double;
                      double altura = formatter.parse(_alturaEC.text) as double;

                      _calcularIMC(
                        peso: peso,
                        altura: altura,
                      );
                    }

                  },
                  child: const Text("CALCULAR IMC"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}