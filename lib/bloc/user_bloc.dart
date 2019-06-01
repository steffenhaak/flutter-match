import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserInit) {
      yield UserState(firstName: (event as UserInit).firstName);
    }
  }
}

abstract class UserEvent {}

class UserInit extends UserEvent {
  final String firstName;

  UserInit({@required this.firstName});
}

class UserState extends Equatable {

  final String firstName;

  UserState({this.firstName}) : super([firstName]);

}

