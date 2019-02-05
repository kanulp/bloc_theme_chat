import 'package:bloc_dynamic_theme/src/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends InheritedWidget {
  ThemeProvider({this.bloc, Key key, this.child})
      : super(key: key, child: child);

  final Widget child;
  final ThemeBloc bloc;

  static ThemeProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ThemeProvider)
        as ThemeProvider);
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return true;
  }
}
