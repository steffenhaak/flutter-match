// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_profile;

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

Serializer<UserProfile> _$userProfileSerializer = new _$UserProfileSerializer();

class _$UserProfileSerializer implements StructuredSerializer<UserProfile> {
  @override
  final Iterable<Type> types = const [UserProfile, _$UserProfile];
  @override
  final String wireName = 'UserProfile';

  @override
  Iterable serialize(Serializers serializers, UserProfile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uuid',
      serializers.serialize(object.uuid, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'topics',
      serializers.serialize(object.topics,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'packages',
      serializers.serialize(object.packages,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'telephoneNumber',
      serializers.serialize(object.telephoneNumber,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserProfile deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserProfileBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'topics':
          result.topics.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'packages':
          result.packages.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'telephoneNumber':
          result.telephoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserProfile extends UserProfile {
  @override
  final String uuid;
  @override
  final String status;
  @override
  final String username;
  @override
  final BuiltList<String> topics;
  @override
  final BuiltList<String> packages;
  @override
  final String telephoneNumber;

  factory _$UserProfile([void updates(UserProfileBuilder b)]) =>
      (new UserProfileBuilder()..update(updates)).build();

  _$UserProfile._(
      {this.uuid,
      this.status,
      this.username,
      this.topics,
      this.packages,
      this.telephoneNumber})
      : super._() {
    if (uuid == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'uuid');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'status');
    }
    if (username == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'username');
    }
    if (topics == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'topics');
    }
    if (packages == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'packages');
    }
    if (telephoneNumber == null) {
      throw new BuiltValueNullFieldError('UserProfile', 'telephoneNumber');
    }
  }

  @override
  UserProfile rebuild(void updates(UserProfileBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfileBuilder toBuilder() => new UserProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfile &&
        uuid == other.uuid &&
        status == other.status &&
        username == other.username &&
        topics == other.topics &&
        packages == other.packages &&
        telephoneNumber == other.telephoneNumber;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, uuid.hashCode), status.hashCode),
                    username.hashCode),
                topics.hashCode),
            packages.hashCode),
        telephoneNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserProfile')
          ..add('uuid', uuid)
          ..add('status', status)
          ..add('username', username)
          ..add('topics', topics)
          ..add('packages', packages)
          ..add('telephoneNumber', telephoneNumber))
        .toString();
  }
}

class UserProfileBuilder implements Builder<UserProfile, UserProfileBuilder> {
  _$UserProfile _$v;

  String _uuid;
  String get uuid => _$this._uuid;
  set uuid(String uuid) => _$this._uuid = uuid;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  ListBuilder<String> _topics;
  ListBuilder<String> get topics =>
      _$this._topics ??= new ListBuilder<String>();
  set topics(ListBuilder<String> topics) => _$this._topics = topics;

  ListBuilder<String> _packages;
  ListBuilder<String> get packages =>
      _$this._packages ??= new ListBuilder<String>();
  set packages(ListBuilder<String> packages) => _$this._packages = packages;

  String _telephoneNumber;
  String get telephoneNumber => _$this._telephoneNumber;
  set telephoneNumber(String telephoneNumber) =>
      _$this._telephoneNumber = telephoneNumber;

  UserProfileBuilder();

  UserProfileBuilder get _$this {
    if (_$v != null) {
      _uuid = _$v.uuid;
      _status = _$v.status;
      _username = _$v.username;
      _topics = _$v.topics?.toBuilder();
      _packages = _$v.packages?.toBuilder();
      _telephoneNumber = _$v.telephoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfile other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserProfile;
  }

  @override
  void update(void updates(UserProfileBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserProfile build() {
    _$UserProfile _$result;
    try {
      _$result = _$v ??
          new _$UserProfile._(
              uuid: uuid,
              status: status,
              username: username,
              topics: topics.build(),
              packages: packages.build(),
              telephoneNumber: telephoneNumber);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'topics';
        topics.build();
        _$failedField = 'packages';
        packages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserProfile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
