import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_match/bloc/web_socket_bloc.dart';
import 'package:flutter_match/built_value/user_profile.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_match/api.dart';


class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc({@required this.webSocketBloc});

  final WebSocketBloc webSocketBloc;

  @override
  UserState get initialState => UserState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    debugPrint("$event");
    if (event is UserInit) {
      yield UserState(userProfile: UserProfile((b) => b
        ..firstName = event.firstName
        ..status = 'Available'
        ..topics.replace([])
        ..packages.replace([])
      ));
      debugPrint("TEST");
      yield* _createUser(event.firstName);

    }
  }

  Stream<UserState> _createUser(String firstName) async* {

      try {
        debugPrint("$firstName");
        Response response = await Dio().post("http://$apiHost/user/create", data: { 'firstName': firstName });
        debugPrint(response.toString());
        if (response.statusCode >= 200 && response.statusCode < 300) {
          final userId = response.data['userId'];
          yield UserState(userProfile: currentState.userProfile.rebuild((b) => b..userId = userId));
          debugPrint('Successfully create user');
          webSocketBloc.dispatch(WebSocketConnect(userId));
        } else {
          yield UserState(userProfile: null);
        }

      } catch (e) {
        print(e);
        yield UserState(userProfile: null);
      }
  }
}

abstract class UserEvent {}

class UserInit extends UserEvent {
  final String firstName;

  UserInit({@required this.firstName});
}

class UserState extends Equatable {

  final UserProfile userProfile;

  UserState({this.userProfile}) : super([userProfile]);

}

