import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:review_native_state_management/app/pages/widgets/imc_gauge.dart';
    
class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {

  final _formKey = GlobalKey<FormState>();
  final _pesoEC = TextEditingController();
  final _alturaEC = TextEditingController();

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
                imc: 15,
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
                  onPressed: () {},
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