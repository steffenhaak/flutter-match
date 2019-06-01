import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_match/built_value/user_created.dart';
import 'package:flutter_match/built_value/user_profile.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class UsersBloc extends Bloc<UserEvent, UsersState> {
  @override
  UsersState get initialState => UsersState(userProfiles: BuiltList<UserCreated>());

  @override
  Stream<UsersState> mapEventToState(UserEvent event) async* {
    if (event is AddUser) {
      yield UsersState(userProfiles: currentState.userProfiles.rebuild((b) => b..add(event.data)));
    }
  }
}

abstract class UserEvent {}

class AddUser extends UserEvent {
  final UserCreated data;

  AddUser({@required this.data});
}

class UsersState extends Equatable {

  final BuiltList<UserCreated> userProfiles;

  UsersState({this.userProfiles}) : super([userProfiles]);

}

