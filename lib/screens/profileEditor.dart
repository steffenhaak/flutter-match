import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_match/bloc/user_bloc.dart';

class ProfileEditor extends StatelessWidget {
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
                size: 50.0,
              ),
            ),
            Container(
              width: 190.0,
              child: Center(
                child: BlocBuilder(
                  bloc: BlocProvider.of<UserBloc>(context),
                  builder: (context, UserState userState) => Text(
                        userState.userProfile.firstName,
                        style: TextStyle(fontSize: 30.0),
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
      body: MyCustomForm(),
    );
  }
}

TextStyle categoryTextStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0);

// Create a Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  int _radioValue1 = 0;
  List<String> topics = List<String>();

  void radioHandler(int value) {

  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Phone Number"),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radioValue1,
                  onChanged: (value) => radioHandler(value),
                ),
                Text("Channel"),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radioValue1,
                  onChanged: (value) => radioHandler(value),
                ),
                Text("Widgets"),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radioValue1,
                  onChanged: (value) => radioHandler(value),
                ),
                Text("Web"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, we want to show a Snackbar
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* 

ListView(
        padding: EdgeInsets.all(25.0),
        children: <Widget>[
          Text(
            "Phone Number:",
            style: categoryTextStyle,
          ),
          Text(
            "Topics:",
            style: categoryTextStyle,
          ),
          Text(
            "Packages:",
            style: categoryTextStyle,
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton.extended(
        icon: Icon(Icons.save),
        label: Text(
          "Safe Profile",
          style: categoryTextStyle,
        ),
        onPressed: () => print("button pressed"), // TODO: add bloc action
      ),

 */
