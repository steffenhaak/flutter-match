import 'package:bloc/bloc.dart';
import 'package:flutter_match/built_value/user_profile.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class UsersBloc extends Bloc<UserEvent, UsersState> {
  @override
  UsersState get initialState => UsersState();

  @override
  Stream<UsersState> mapEventToState(UserEvent event) async* {
    if (event is UsersInit) {
      yield UsersState(userProfiles: (event as UsersInit).userProfiles);
    }
  }
}

abstract class UserEvent {}

class UsersInit extends UserEvent {
  final List<UserProfile> userProfiles;

  UsersInit({@required this.userProfiles});
}

class UsersState extends Equatable {

  final List<UserProfile> userProfiles;

  UsersState({this.userProfiles}) : super([userProfiles]);

}

