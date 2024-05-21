import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:review_native_state_management/app/pages/widgets/imc_gauge.dart';
    
class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({super.key});

  @override
  State<ValueNotifierPage> createState() => _ValueNotifierPageState();
}

class _ValueNotifierPageState extends State<ValueNotifierPage> {

  final _formKey = GlobalKey<FormState>();
  final _pesoEC = TextEditingController();
  final _alturaEC = TextEditingController();

  // ValueNotifier é uma classe do Flutter que funciona com reatividade
  // Toda vez que o valor de uma variável desse tipo é alterada ela manda
  // rebuildar um widget específico que vem junto com ela (ValueListenableBuilder)
  var imc = ValueNotifier(0.0);

  Future<void> _calcularIMC({
    required double peso,
    required double altura,
  }) async {

    imc.value = 0.0;

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      imc.value = peso / pow(altura, 2);
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

              ValueListenableBuilder<double>(
                valueListenable: imc,
                builder: (context, value, child) {
                  return ImcGauge(
                    imc: value,
                  );
                },
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