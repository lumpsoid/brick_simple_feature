import 'package:meta/meta.dart';

@immutable
class {{feature_name.pascalCase()}}State {
  const {{feature_name.pascalCase()}}State({
    this.isLoading = false,
  });

  final bool isLoading;

  {{feature_name.pascalCase()}}State copyWith({
    bool? isLoading,
  }) {
    return {{feature_name.pascalCase()}}State(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is {{feature_name.pascalCase()}}State &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading;

  @override
  int get hashCode => isLoading.hashCode;
}
