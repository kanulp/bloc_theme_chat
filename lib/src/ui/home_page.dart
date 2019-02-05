import 'package:bloc_dynamic_theme/src/bloc/theme_bloc.dart';
import 'package:bloc_dynamic_theme/src/bloc/theme_provider.dart';
import 'package:bloc_dynamic_theme/src/model/theme_model.dart';
import 'package:bloc_dynamic_theme/src/ui/chat_home_page.dart';
import 'package:bloc_dynamic_theme/src/utils/user_prefs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserPrefs _userPrefs = UserPrefs();
  String themename;
  ThemeBloc _bloc;
  @override
  void initState() {
    _bloc = ThemeBloc();

    _userPrefs.getTheme().then((s) {
      themename = s;
      print('shared p called $s');
      if (s == null) _bloc.updateTheme(ThemeModel.getTheme('light'));
      setState(() {});
      _bloc.setTheme.add(ThemeModel.getTheme(themename ?? 'light'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      bloc: _bloc,
      child: StreamBuilder(
        stream: _bloc.getTheme,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          } else {
            return MaterialApp(
              title: 'Bloc Theme Dynamic',
              theme: snapshot.data.themedata,
              home: ChatHomePage(),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
