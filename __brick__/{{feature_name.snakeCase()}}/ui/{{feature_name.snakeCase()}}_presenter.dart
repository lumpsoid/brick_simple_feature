class {{feature_name.pascalCase()}}Presenter extends Presenter<{{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Presenter([{{feature_name.pascalCase()}}State? initialState])
      : super(initialState ?? const {{feature_name.pascalCase()}}State());

  void setLoading(bool value) =>
      updateState((s) => s.copyWith(isLoading: value));
}
