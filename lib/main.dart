// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_match/bloc/user_bloc.dart';
import 'package:flutter_match/bloc/users_bloc.dart';
import 'package:flutter_match/screens/detailedProfileView.dart';
import 'package:flutter_match/screens/onboardScreen.dart';
import 'package:flutter_match/screens/profileEditor.dart';

void main() => runApp(MyApp());

const serverHost = "localhost:9000";

/// This Widget is the main application widget.
class MyApp extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserBloc _userBloc = UserBloc();
  final UsersBloc _usersBloc = UsersBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      home: BlocProviderTree(
        blocProviders: [
          BlocProvider<UserBloc>(bloc: _userBloc),
        ],
        child: BlocBuilder(
          bloc: _userBloc,
          builder: (_, UserState userState) {
            if (userState.firstName != null)
              return ProfileEditor();
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
              Text('Hallo ${userState.firstName}'),
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
      // body: UserListView(),
    );
  }
}
