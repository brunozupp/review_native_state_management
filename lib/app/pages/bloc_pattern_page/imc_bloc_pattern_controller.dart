import 'dart:async';
import 'dart:math';

import 'package:review_native_state_management/app/pages/bloc_pattern_page/imc_bloc_pattern_state.dart';

class ImcBlocPatternController {

  // Caso eu tivesse mais de uma StreamBuilder na minha tela escutando o mesmo cara
  // eu precisaria adicionar o .broadcast no final para indicar multiplas saidas
  final _imcStreamController = StreamController<ImcBlocPatternState>()
    ..add(ImcBlocPatternDataState(imc: 0));

  Stream<ImcBlocPatternState> get imc => _imcStreamController.stream;

  Future<void> calcularIMC({
    required double peso,
    required double altura,
  }) async {

    _imcStreamController.add(
      ImcBlocPatternLoadingState(),
    );

    await Future.delayed(const Duration(seconds: 1));

    _imcStreamController.add(
      ImcBlocPatternDataState(imc: peso / pow(altura, 2)),
    );
  }

  void dispose() {
    _imcStreamController.close();
  }  
}