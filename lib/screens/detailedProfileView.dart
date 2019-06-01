import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_match/bloc/user_bloc.dart';

class DetailedProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("flutter-match"),
        title: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              child: Icon(
                Icons.person,
                size: 60.0,
              ),
            ),
            Container(
              width: 190.0,
              child: Center(
                child: BlocBuilder(
                  bloc: BlocProvider.of<UserBloc>(context),
                  builder: (context, UserState userState) => Text(
                        userState.firstName,
                        style: TextStyle(fontSize: 35.0),
                      ),
                ),
              ),
            ),
            Container(
              width: 40.0,
              height: 30.0,
              padding: const EdgeInsets.all(
                  20.0), //I used some padding without fixed width and height
              decoration: new BoxDecoration(
                shape: BoxShape
                    .circle, // You can use like this way or like the below line
                //borderRadius: new BorderRadius.circular(30.0),
                color: Colors.green,
              ),
              child: new Text(
                " ",
                style: new TextStyle(color: Colors.white, fontSize: 50.0),
              ), // You can add a Icon instead of text also, like below.
              //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(25.0),
        children: <Widget>[
          Text(
            "Related Topics:",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text("ExampleTopic1"),
          Text("ExampleTopic2"),
          Text("ExampleTopic3"),

          new Container(height: 25,),
          Text(
            "Related Packages:",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text("ExampleTopic1"),
          Text("ExampleTopic2"),
          Text("ExampleTopic3"),
        ],
      ),
      floatingActionButton: new FloatingActionButton.extended(
        icon: Icon(Icons.phone),
        label: Text("Get in Touch"),
        onPressed: () => print("button pressed"), // TODO: add bloc action
      ),
    );
  }
}
