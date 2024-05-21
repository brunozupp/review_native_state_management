import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:review_native_state_management/app/pages/widgets/imc_gauge_range.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
    
class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {

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
        child: Column(
          children: [
            SfRadialGauge(
              axes: [
                RadialAxis(
                  showLabels: false,
                  showAxisLine: false,
                  showTicks: false,
                  minimum: 12.5,
                  maximum: 47.9,
                  ranges: [
                    ImcGaugeRange(
                      color: Colors.blue,
                      start: 12.5,
                      end: 18.5,
                      label: "MAGREZA",
                    ),
                    ImcGaugeRange(
                      color: Colors.green,
                      start: 18.5,
                      end: 24.5,
                      label: "NORMAL",
                    ),
                    ImcGaugeRange(
                      color: Colors.yellow[600]!,
                      start: 24.5,
                      end: 29.9,
                      label: "SOBREPESO",
                    ),
                    ImcGaugeRange(
                      color: Colors.red[500]!,
                      start: 29.9,
                      end: 39.9,
                      label: "OBESIDADE",
                    ),
                    ImcGaugeRange(
                      color: Colors.red[900]!,
                      start: 39.9,
                      end: 47.9,
                      label: "OBESIDADE GRAVE",
                    ),
                  ],
                  pointers: const [
                    NeedlePointer(
                      value: 15,
                      enableAnimation: true,
                    )
                  ],
                ),
              ],
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
    );
  }
}