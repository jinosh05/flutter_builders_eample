# flutter_builders_example

Welcome to the Flutter Project! This project demonstrates various state management techniques and their implementation using different types of builders and state management solutions in Flutter. Below you'll find detailed explanations and usage scenarios for each widget and concept included in this project.

## Table of Contents
- [Getting Started](#getting-started)
- [Widgets and Scenarios](#widgets-and-scenarios)
  - [Builder](#builder)
  - [ValueListenableBuilder](#valuelistenablebuilder)
  - [ValueListenableBuilder with Bloc](#valuelistenablebuilder-with-bloc)
  - [ValueListenableBuilder with Cubit](#valuelistenablebuilder-with-cubit)
  - [ValueListenableBuilder with Services](#valuelistenablebuilder-with-services)
  - [BlocBuilder's Universal Memory](#blocbuilders-universal-memory)
  - [BlocBuilder's Page Memory](#blocbuilders-page-memory)
  - [BlocBuilder with Async Function](#blocbuilder-with-async-function)
  - [CubitBuilder under Build When condition](#cubitbuilder-under-build-when-condition)
  - [BlocBuilder under Build When condition](#blocbuilder-under-build-when-condition)

## Getting Started

To get started with this project, clone the repository and install the dependencies:

```bash
git clone https://github.com/jinosh05/flutter_builders_example.git
cd flutter_builders_example
flutter pub get
```

Then, run the project:

```bash
flutter run
```

## Widgets and Scenarios

### Builder

The `Builder` widget is a general-purpose widget that builds a widget tree inside the builder function. This is particularly useful when you need a new context with different inherited widgets.

**Usage:**
```dart
Builder(
  builder: (BuildContext context) {
    return Text('Hello, Builder!');
  },
)
```

### ValueListenableBuilder

The `ValueListenableBuilder` is a widget that listens to a `ValueListenable` and rebuilds when the value changes.

**Usage:**
```dart
ValueListenableBuilder<int>(
  valueListenable: _counter,
  builder: (context, value, child) {
    return Text('Value: $value');
  },
)
```

### ValueListenableBuilder with Bloc

Combining `ValueListenableBuilder` with Bloc allows you to listen to state changes and rebuild the UI accordingly.

**Usage:**
```dart
ValueListenableBuilder<MyState>(
  valueListenable: myBloc.stream,
  builder: (context, state, child) {
    if (state is MyLoadedState) {
      return Text('Loaded: ${state.data}');
    }
    return CircularProgressIndicator();
  },
)
```

### ValueListenableBuilder with Cubit

Combining `ValueListenableBuilder` with Cubit allows you to listen to state changes and rebuild the UI accordingly.

**Usage:**
```dart
ValueListenableBuilder<MyState>(
  valueListenable: myCubit.stream,
  builder: (context, state, child) {
    if (state is MyLoadedState) {
      return Text('Loaded: ${state.data}');
    }
    return CircularProgressIndicator();
  },
)
```

### ValueListenableBuilder with Services

Using `ValueListenableBuilder` with services is useful for listening to service-based state changes.

**Usage:**
```dart
ValueListenableBuilder<ServiceState>(
  valueListenable: myService.stateNotifier,
  builder: (context, state, child) {
    if (state is ServiceLoadedState) {
      return Text('Service Data: ${state.data}');
    }
    return CircularProgressIndicator();
  },
)
```

### BlocBuilder's Universal Memory

`BlocBuilder` with universal memory refers to using a single Bloc for managing the state across multiple widgets or screens.

**Usage:**
```dart
BlocBuilder<MyBloc, MyState>(
  builder: (context, state) {
    if (state is MyLoadedState) {
      return Text('Data: ${state.data}');
    }
    return CircularProgressIndicator();
  },
)
```

### BlocBuilder's Page Memory

`BlocBuilder` with page memory is used to retain the state of a particular page or widget, even when navigating away and back to it.

**Usage:**
```dart
BlocProvider(
  create: (context) => MyBloc(),
  child: MyPage(),
)

// Inside MyPage
BlocBuilder<MyBloc, MyState>(
  builder: (context, state) {
    if (state is MyLoadedState) {
      return Text('Data: ${state.data}');
    }
    return CircularProgressIndicator();
  },
)
```

### BlocBuilder with Async Function

Using `BlocBuilder` with an async function allows handling asynchronous events and state changes.

**Usage:**
```dart
BlocBuilder<MyBloc, MyState>(
  builder: (context, state) {
    if (state is MyLoadingState) {
      return CircularProgressIndicator();
    } else if (state is MyLoadedState) {
      return Text('Data: ${state.data}');
    }
    return Text('Error');
  },
)
```

### CubitBuilder under Build When condition

`CubitBuilder` with a `buildWhen` condition allows you to conditionally rebuild your widget based on specific state changes.

**Usage:**
```dart
CubitBuilder<MyCubit, MyState>(
  buildWhen: (previous, current) {
    return current is MySpecificState; // Only rebuild if the state is MySpecificState
  },
  builder: (context, state) {
    if (state is MySpecificState) {
      return Text('Specific State Data: ${state.data}');
    }
    return CircularProgressIndicator();
  },
)
```

### BlocBuilder under Build When condition

`BlocBuilder` with a `buildWhen` condition allows you to conditionally rebuild your widget based on specific state changes.

**Usage:**
```dart
BlocBuilder<MyBloc, MyState>(
  buildWhen: (previous, current) {
    return current is MySpecificState; // Only rebuild if the state is MySpecificState
  },
  builder: (context, state) {
    if (state is MySpecificState) {
      return Text('Specific State Data: ${state.data}');
    }
    return CircularProgressIndicator();
  },
)
```

## Conclusion

This project demonstrates various advanced state management techniques in Flutter using different combinations of `Builder`, `ValueListenableBuilder`, `BlocBuilder`, and `Cubit`. Feel free to explore the code and adapt these patterns to your own Flutter projects!

If you have any questions or suggestions, please open an issue or submit a pull request.

Happy coding!

---

Remember to replace placeholders like `MyBloc`, `MyState`, `MyCubit`, `myService`, `myCubit`, `_counter`, etc., with actual implementations relevant to your project.




## 🔑 License
- This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details