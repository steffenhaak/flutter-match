library user_profile;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'user_profile.g.dart';

abstract class UserProfile implements Built<UserProfile, UserProfileBuilder> {
  UserProfile._();

  factory UserProfile([updates(UserProfileBuilder b)]) = _$UserProfile;

  @BuiltValueField(wireName: 'userId')
  @nullable
  String get userId;
  @BuiltValueField(wireName: 'status')
  String get status;
  @BuiltValueField(wireName: 'firstName')
  String get firstName;
  @BuiltValueField(wireName: 'topics')
  BuiltList<String> get topics;
  @BuiltValueField(wireName: 'packages')
  BuiltList<String> get packages;
  @BuiltValueField(wireName: 'telephoneNumber')
  @nullable
  String get telephoneNumber;
  String toJson() {
    return json.encode(serializers.serializeWith(UserProfile.serializer, this));
  }

  static UserProfile fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserProfile.serializer, json.decode(jsonString));
  }

  static Serializer<UserProfile> get serializer => _$userProfileSerializer;
}
