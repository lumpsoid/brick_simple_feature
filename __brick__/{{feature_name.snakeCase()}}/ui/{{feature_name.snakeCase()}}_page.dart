import 'package:flutter/material.dart';

class {{feature_name.pascalCase()}}Page extends StatefulWidget {
  const {{feature_name.pascalCase()}}Page({super.key});

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/{{feature_name.snakeCase()}}'),
      builder: (context) => const {{feature_name.pascalCase()}}Page(),
    );
  }

  @override
  State<{{feature_name.pascalCase()}}Page> createState() => _{{feature_name.pascalCase()}}PageState();
}

class _{{feature_name.pascalCase()}}PageState extends State<{{feature_name.pascalCase()}}Page> {
  late final {{feature_name.pascalCase()}}Controller _controller;
  late final ValueNotifier<{{feature_name.pascalCase()}}State> _stateNotifier;

  @override
  void initState() {
    super.initState();
    _controller = {{feature_name.pascalCase()}}Controller(
      repo: getIt<{{feature_name.pascalCase()}}Repository>(),
    );
    _stateNotifier = ValueNotifier<{{feature_name.pascalCase()}}State>(
      const {{feature_name.pascalCase()}}State(),
    );
    _controller.onViewAttach(
      updater: (s) => _stateNotifier.value = s,
      pusher: _onEffect,
    );
  }

  void _onEffect({{feature_name.pascalCase()}}Effect effect) {
    if (!mounted) return;
    switch (effect) {
      case {{feature_name.pascalCase()}}EffectInit(:final state):
        // Initialize text controllers etc. from state
        break;
      case {{feature_name.pascalCase()}}EffectPop():
        Navigator.of(context).maybePop();
      case {{feature_name.pascalCase()}}EffectShowError(:final error):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
    }
  }

  @override
  void dispose() {
    _stateNotifier.dispose();
    _controller.onViewDetach();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<{{feature_name.pascalCase()}}State>(
      valueListenable: _stateNotifier,
      builder: (context, state, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('{{feature_name.pascalCase()}}'),
          ),
          body: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox.shrink(), // TODO: build UI
        );
      },
    );
  }
}
