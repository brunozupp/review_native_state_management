import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:review_native_state_management/app/pages/bloc_pattern_page/imc_bloc_pattern_controller.dart';
import 'package:review_native_state_management/app/pages/bloc_pattern_page/imc_bloc_pattern_state.dart';
import 'package:review_native_state_management/app/pages/widgets/imc_gauge.dart';

// A utilização de Streams para atualizar o estado
// O conceito do bloc pattern é eu dividir minhas regras de negócio em uma classe específica
// É MUITO semelhante ao ChangeNotifier, com a exceção que eu uso Streams para a reatividade
class BlocPatternPage extends StatefulWidget {
  const BlocPatternPage({super.key});

  @override
  State<BlocPatternPage> createState() => _BlocPatternPageState();
}

class _BlocPatternPageState extends State<BlocPatternPage> {

  final _controller = ImcBlocPatternController();

  final _formKey = GlobalKey<FormState>();
  final _pesoEC = TextEditingController();
  final _alturaEC = TextEditingController();

  @override
  void dispose() {
    _pesoEC.dispose();
    _alturaEC.dispose();
    _controller.dispose();
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

              StreamBuilder<ImcBlocPatternState>(
                stream: _controller.imc,
                builder: (context, snapshot) {
                  return switch(snapshot.data) {
                    ImcBlocPatternDataState(imc: final data) => ImcGauge(
                      imc: data,
                    ),
                    ImcBlocPatternLoadingState() || null => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  };
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

                      _controller.calcularIMC(
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