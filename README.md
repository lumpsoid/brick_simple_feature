# simple_feature

A [Mason](https://pub.dev/packages/mason_cli) brick that generates Flutter feature boilerplate using a Controller/Presenter/State/Effects/Repository architecture.

## Overview

`simple_feature` scaffolds a complete, ready-to-extend feature module with the following layers:

| File | Description |
|------|-------------|
| `*_page.dart` | StatefulWidget that listens to state via `ValueNotifier` and dispatches side effects |
| `*_controller.dart` | Business logic handler; owns the presenter and effect pusher |
| `*_presenter.dart` | Derives new `State` objects and notifies the view |
| `*_state.dart` | Immutable state class with `copyWith`, `==`, and `hashCode` |
| `*_effect.dart` | Sealed class hierarchy for one-shot side effects (navigation, errors, etc.) |
| `*_repository.dart` | Abstract interface + in-memory stub for the feature's data layer |

## Installation

```sh
# Install Mason CLI if you haven't already
dart pub global activate mason_cli

# Add the brick from path (local)
mason add simple_feature --path path/to/brick_simple_feature

# Or add from Git
mason add simple_feature --git-url https://github.com/lumpsoid/brick_simple_feature
```

## Usage

```sh
mason make simple_feature
```

You will be prompted for:

| Variable | Type | Description | Example |
|----------|------|-------------|---------|
| `feature_name` | `string` | Feature name in PascalCase | `UserProfile`, `OnboardNew` |

### Example

```
? Feature name (PascalCase): UserProfile
```

This generates:

```
user_profile/
├── domain/
│   └── repositories/
│       └── user_profile_repository.dart
└── ui/
    ├── user_profile_controller.dart
    ├── user_profile_effect.dart
    ├── user_profile_page.dart
    ├── user_profile_presenter.dart
    └── user_profile_state.dart
```

## Architecture

The brick follows a unidirectional data flow pattern:

```
View (Page)
  │  dispatches events
  ▼
Controller
  │  updates state via Presenter
  ▼
Presenter → ValueNotifier<State> → Page rebuilds
  │
  └─ pushes Effects → Page handles side effects
                       (navigation, snackbars, etc.)
```

**State** is immutable and flows down. **Effects** are fire-and-forget signals for things that shouldn't live in state (e.g. `pop`, `showError`).

## Default Effects

Three effects are generated out of the box:

- `EffectInit` — fired when the view attaches; use it to seed text controllers or other UI state from the loaded data.
- `EffectPop` — triggers `Navigator.maybePop()`.
- `EffectShowError` — displays a `SnackBar` with the error message.

Add your own by extending the sealed `*Effect` class.

## Dependencies

The generated code assumes the following packages are present in your project:

- [`meta`](https://pub.dev/packages/meta) — for `@immutable`
- [`get_it`](https://pub.dev/packages/get_it) (or equivalent) — used in `*_page.dart` to resolve the repository (`getIt<...>()`)
- Your own `Presenter`, `SideEffector`, `StateUpdater`, and `SideEffectPusher` base types — adapt the generated code to match your project's core utilities.

## License

MIT © lumpsoid
