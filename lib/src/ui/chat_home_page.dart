import 'package:bloc_dynamic_theme/src/bloc/theme_bloc.dart';
import 'package:bloc_dynamic_theme/src/bloc/theme_provider.dart';
import 'package:bloc_dynamic_theme/src/model/theme_model.dart';
import 'package:bloc_dynamic_theme/src/ui/call_page.dart';
import 'package:bloc_dynamic_theme/src/ui/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatHomePage extends StatefulWidget {
  _ChatHomePageState createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'Chat'),
    new Tab(text: 'Calls'),
  ];
  TabController _tabController;
  static const FBURL = "https://www.facebook.com/groups/392934177836346";
  static const GITHUBURL = "https://github.com/kanulp";
  static const TWITTERURL = "https://twitter.com/kanu_lp";

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  static _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  var snackBar = SnackBar(
    content: Text('Join FB Group!'),
    action: SnackBarAction(
        label: 'Join',
        textColor: Colors.white,
        onPressed: () => _launchURL(FBURL)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        titleSpacing: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          tabs: myTabs,
          controller: _tabController,
        ),
      ),
      drawer: buildDrawer(context),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            child: new Icon(Icons.add),
            onPressed: () {
              Scaffold.of(context).showSnackBar(snackBar);
            },
          );
        },
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[ChatPage(), CallPage()],
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    ThemeBloc bloc = ThemeProvider.of(context).bloc;
    return Drawer(
      elevation: 0.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('Twitter @kanu_lp'),
            accountName: Text('Karan Gajjar'),
            currentAccountPicture: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/796056221241380864/A5uEVRLw_400x400.jpg'))),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Join Flutter FB Group'),
            onTap: () {
              Navigator.pop(context);
              _launchURL(FBURL);
            },
          ),
          Divider(
            height: 2.0,
          ),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text('Follow me on twitter @kanu_lp'),
            onTap: () {
              Navigator.pop(context);
              _launchURL(TWITTERURL);
            },
          ),
          Divider(
            height: 2.0,
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('My Github @kanulp'),
            onTap: () {
              _launchURL(GITHUBURL);
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 2.0,
          ),
          StreamBuilder(
            stream: bloc.getTheme,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text(snapshot.data.name == "light"
                      ? 'Change to Dark Theme'
                      : 'Change to Light Theme'),
                  onTap: () {
                    Navigator.pop(context);
                    bloc.updateTheme(ThemeModel.getTheme(
                        snapshot.data.name == "light" ? 'dark' : 'light'));
                  },
                );
              } else {
                return ListTile(
                  title: Text('......'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
