sealed class {{feature_name.pascalCase()}}Effect {
  const {{feature_name.pascalCase()}}Effect();
}

final class {{feature_name.pascalCase()}}EffectInit extends {{feature_name.pascalCase()}}Effect {
  const {{feature_name.pascalCase()}}EffectInit(this.state);
  final {{feature_name.pascalCase()}}State state;
}

final class {{feature_name.pascalCase()}}EffectPop extends {{feature_name.pascalCase()}}Effect {
  const {{feature_name.pascalCase()}}EffectPop();
}

final class {{feature_name.pascalCase()}}EffectShowError extends {{feature_name.pascalCase()}}Effect {
  const {{feature_name.pascalCase()}}EffectShowError(this.error);
  final Object error;
}
