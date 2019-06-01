library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_match/built_value/user_profile.dart';

import 'built_value/user_created.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';


/// Collection of generated serializers for the built_value chat example.
@SerializersFor([
  UserProfile,
  UserCreated,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
