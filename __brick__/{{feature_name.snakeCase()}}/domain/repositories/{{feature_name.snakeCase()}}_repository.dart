abstract interface class {{feature_name.pascalCase()}}Repository {
  // Define repository methods needed by this feature
  // e.g. Future<UserProfile> getProfile(String id);
}

/// InMemory implementation for UI development before real backend
class InMemory{{feature_name.pascalCase()}}Repository implements {{feature_name.pascalCase()}}Repository {
  // Implement stub methods here
}
