// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_match/bloc/user_bloc.dart';
import 'package:flutter_match/bloc/users_bloc.dart';
import 'package:flutter_match/bloc/web_socket_bloc.dart';
import 'package:flutter_match/screens/detailedProfileView.dart';
import 'package:flutter_match/screens/onboardScreen.dart';
import 'package:flutter_match/screens/profileEditor.dart';
import 'package:flutter_match/screens/userListView.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  WebSocketBloc _webSocketBloc;
  UserBloc _userBloc;
  UsersBloc _usersBloc;

  @override
  void initState() {
    super.initState();
    _usersBloc = UsersBloc();
    _webSocketBloc = WebSocketBloc(usersBloc: _usersBloc);
    _userBloc = UserBloc(webSocketBloc: _webSocketBloc);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      home: BlocProviderTree(
        blocProviders: [
          BlocProvider<UserBloc>(bloc: _userBloc),
          BlocProvider<UsersBloc>(bloc: _usersBloc),
        ],
        child: BlocBuilder(
          bloc: _userBloc,
          builder: (_, UserState userState) {
            if (userState.userProfile != null)
              return MainScreen();
            else
              return OnBoardScreen();
          },
        ),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder(
          bloc: BlocProvider.of<UserBloc>(context),
          builder: (context, UserState userState) =>
              Text('Hallo ${userState.userProfile.firstName}'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.verified_user),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // Implement navigation to shopping cart page here...
              BlocProvider.of<UserBloc>(context)
                  .dispatch(UserInit(firstName: 'Steffen'));
            },
          ),
        ],
      ),
      body: UserListView(),
    );
  }
}
