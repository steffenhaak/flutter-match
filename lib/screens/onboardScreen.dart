import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_match/bloc/user_bloc.dart';

const _bigFontSize = 40.0;
const _smallFontSize = 18.0;
const _padding = 30.0;

class OnBoardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OnBoardScreenState();
}

class OnBoardScreenState extends State<OnBoardScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text(
            " ",
            style: new TextStyle(fontSize: 50),
          ),

          // Horizontal space
          Center(
            child: Text(
              "Welcome to",
              style: new TextStyle(fontSize: _bigFontSize),
            ),
          ),
          Center(
            child: Text(
              "flutter-match!",
              style: new TextStyle(fontSize: _bigFontSize),
            ),
          ),

          // Horizontal space
          Text(
            " ",
            style: new TextStyle(fontSize: 30),
          ),

          // welcome text
          Padding(
            padding: EdgeInsets.all(_padding),
            child: Center(
              child: Text(
                "To use this app, just enter Your name in the field below and You are ready to go :)",
                style: new TextStyle(
                  fontSize: _smallFontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // input field
          Center(
            child: Padding(
              padding: EdgeInsets.all(_padding),
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your name',
                  ),
                  controller: _textController,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () => BlocProvider.of<UserBloc>(context).dispatch(
                      UserInit(firstName: _textController.text ),
                    ),
                child: Text("Join"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*

appBar: AppBar(
        title: Text("flutter-match"),
      ),

 */
