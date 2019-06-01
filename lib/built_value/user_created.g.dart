// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_created;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<UserCreated> _$userCreatedSerializer = new _$UserCreatedSerializer();

class _$UserCreatedSerializer implements StructuredSerializer<UserCreated> {
  @override
  final Iterable<Type> types = const [UserCreated, _$UserCreated];
  @override
  final String wireName = 'UserCreated';

  @override
  Iterable serialize(Serializers serializers, UserCreated object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'onlineStatus',
      serializers.serialize(object.onlineStatus,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserCreated deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserCreatedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'onlineStatus':
          result.onlineStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserCreated extends UserCreated {
  @override
  final String userId;
  @override
  final String firstName;
  @override
  final String onlineStatus;

  factory _$UserCreated([void updates(UserCreatedBuilder b)]) =>
      (new UserCreatedBuilder()..update(updates)).build();

  _$UserCreated._({this.userId, this.firstName, this.onlineStatus})
      : super._() {
    if (userId == null) {
      throw new BuiltValueNullFieldError('UserCreated', 'userId');
    }
    if (firstName == null) {
      throw new BuiltValueNullFieldError('UserCreated', 'firstName');
    }
    if (onlineStatus == null) {
      throw new BuiltValueNullFieldError('UserCreated', 'onlineStatus');
    }
  }

  @override
  UserCreated rebuild(void updates(UserCreatedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserCreatedBuilder toBuilder() => new UserCreatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserCreated &&
        userId == other.userId &&
        firstName == other.firstName &&
        onlineStatus == other.onlineStatus;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, userId.hashCode), firstName.hashCode),
        onlineStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserCreated')
          ..add('userId', userId)
          ..add('firstName', firstName)
          ..add('onlineStatus', onlineStatus))
        .toString();
  }
}

class UserCreatedBuilder implements Builder<UserCreated, UserCreatedBuilder> {
  _$UserCreated _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _onlineStatus;
  String get onlineStatus => _$this._onlineStatus;
  set onlineStatus(String onlineStatus) => _$this._onlineStatus = onlineStatus;

  UserCreatedBuilder();

  UserCreatedBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _firstName = _$v.firstName;
      _onlineStatus = _$v.onlineStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserCreated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserCreated;
  }

  @override
  void update(void updates(UserCreatedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserCreated build() {
    final _$result = _$v ??
        new _$UserCreated._(
            userId: userId, firstName: firstName, onlineStatus: onlineStatus);
    replace(_$result);
    return _$result;
  }
}
