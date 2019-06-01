import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_match/bloc/users_bloc.dart';

class UserListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserListViewState();
}

class UserListViewState extends State<UserListView> {
  var _items = List<String>();
  var _defaultItems = List<String>();
  final _searchTextController = TextEditingController();
  // var _filter = "";

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  initState() {
    _defaultItems.add("User 001");
    _defaultItems.add("Coder 002");
    _defaultItems.add("Flutter 003");
    _items.addAll(_defaultItems);
    // _searchTextController.addListener(() {
    //   setState(() {
    //     _filter = _searchTextController.text;
    //   });
    // });
  }

  void filterSearchResults(String query) {
    List<String> visibleItems = List<String>();
    visibleItems.addAll(_defaultItems);
    if (query.isNotEmpty) {
      List<String> filteredItems = List<String>();
      visibleItems.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          filteredItems.add(item);
        }
      });
      setState(() {
        _items.clear();
        _items.addAll(filteredItems);
      });
      return;
    } else {
      setState(() {
        _items.clear();
        _items.addAll(_defaultItems);
      });
    }
  }

  Widget userCard(item) {
    return Card(
        child: Padding(padding: EdgeInsets.all(8.0), child: Text(item.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              filterSearchResults(value);
            },
            controller: _searchTextController,
            decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        Expanded(
            child: BlocBuilder(
        bloc: BlocProvider.of<UsersBloc>(context),
    builder: (context, UsersState userState) =>
    ListView.builder(
          shrinkWrap: true,
          itemCount: userState.userProfiles.length,
          itemBuilder: (context, position) {
            debugPrint(userState.userProfiles.toString());
            return userCard(userState.userProfiles[position]);
          },
        ),
        ),
    ),
      ],
    ));
  }
}
