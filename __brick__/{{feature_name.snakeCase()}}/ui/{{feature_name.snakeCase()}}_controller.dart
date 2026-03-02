class {{feature_name.pascalCase()}}Controller {
  {{feature_name.pascalCase()}}Controller({
    required {{feature_name.pascalCase()}}Repository repo,
    Presenter<{{feature_name.pascalCase()}}State>? presenter,
    SideEffector<{{feature_name.pascalCase()}}Effect>? effectPusher,
  })  : _repo = repo,
        _presenter = presenter ?? {{feature_name.pascalCase()}}Presenter(),
        _effectPusher = effectPusher ?? SideEffector<{{feature_name.pascalCase()}}Effect>();

  final {{feature_name.pascalCase()}}Repository _repo;
  final Presenter<{{feature_name.pascalCase()}}State> _presenter;
  final SideEffector<{{feature_name.pascalCase()}}Effect> _effectPusher;

  void onViewAttach({
    required StateUpdater<{{feature_name.pascalCase()}}State> updater,
    required SideEffectPusher<{{feature_name.pascalCase()}}Effect> pusher,
  }) {
    _presenter.attach(updater);
    _effectPusher
      ..attach(pusher)
      ..push({{feature_name.pascalCase()}}EffectInit(const {{feature_name.pascalCase()}}State()));
  }

  void onViewDetach() {
    _presenter.detach();
    _effectPusher.detach();
  }

  // TODO: add event handlers, e.g.:
  // void onSubmitTapped() { ... }
}
