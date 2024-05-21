sealed class ImcBlocPatternState { }

class ImcBlocPatternDataState extends ImcBlocPatternState {

  final double imc;

  ImcBlocPatternDataState({
    required this.imc,
  });   
}

class ImcBlocPatternLoadingState extends ImcBlocPatternState { }