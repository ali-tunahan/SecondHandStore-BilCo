// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UserType _$number0 = const UserType._('number0');
const UserType _$number1 = const UserType._('number1');
const UserType _$number2 = const UserType._('number2');
const UserType _$number3 = const UserType._('number3');

UserType _$valueOf(String name) {
  switch (name) {
    case 'number0':
      return _$number0;
    case 'number1':
      return _$number1;
    case 'number2':
      return _$number2;
    case 'number3':
      return _$number3;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<UserType> _$values = new BuiltSet<UserType>(const <UserType>[
  _$number0,
  _$number1,
  _$number2,
  _$number3,
]);

class _$UserTypeMeta {
  const _$UserTypeMeta();
  UserType get number0 => _$number0;
  UserType get number1 => _$number1;
  UserType get number2 => _$number2;
  UserType get number3 => _$number3;
  UserType valueOf(String name) => _$valueOf(name);
  BuiltSet<UserType> get values => _$values;
}

abstract class _$UserTypeMixin {
  // ignore: non_constant_identifier_names
  _$UserTypeMeta get UserType => const _$UserTypeMeta();
}

Serializer<UserType> _$userTypeSerializer = new _$UserTypeSerializer();

class _$UserTypeSerializer implements PrimitiveSerializer<UserType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'number0': 0,
    'number1': 1,
    'number2': 2,
    'number3': 3,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'number0',
    1: 'number1',
    2: 'number2',
    3: 'number3',
  };

  @override
  final Iterable<Type> types = const <Type>[UserType];
  @override
  final String wireName = 'UserType';

  @override
  Object serialize(Serializers serializers, UserType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UserType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UserType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
