library user_created;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_match/serializers.dart';

part 'user_created.g.dart';

abstract class UserCreated implements Built<UserCreated, UserCreatedBuilder> {
  UserCreated._();

  factory UserCreated([updates(UserCreatedBuilder b)]) = _$UserCreated;

  @BuiltValueField(wireName: 'userId')
  String get userId;
  @BuiltValueField(wireName: 'firstName')
  String get firstName;
  @BuiltValueField(wireName: 'onlineStatus')
  String get onlineStatus;
  String toJson() {
    return json.encode(serializers.serializeWith(UserCreated.serializer, this));
  }

  static UserCreated fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserCreated.serializer, json.decode(jsonString));
  }

  static Serializer<UserCreated> get serializer => _$userCreatedSerializer;
}
