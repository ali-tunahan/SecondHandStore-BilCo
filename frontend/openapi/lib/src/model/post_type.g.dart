// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PostType _$number0 = const PostType._('number0');
const PostType _$number1 = const PostType._('number1');
const PostType _$number2 = const PostType._('number2');
const PostType _$number3 = const PostType._('number3');

PostType _$valueOf(String name) {
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

final BuiltSet<PostType> _$values = new BuiltSet<PostType>(const <PostType>[
  _$number0,
  _$number1,
  _$number2,
  _$number3,
]);

class _$PostTypeMeta {
  const _$PostTypeMeta();
  PostType get number0 => _$number0;
  PostType get number1 => _$number1;
  PostType get number2 => _$number2;
  PostType get number3 => _$number3;
  PostType valueOf(String name) => _$valueOf(name);
  BuiltSet<PostType> get values => _$values;
}

abstract class _$PostTypeMixin {
  // ignore: non_constant_identifier_names
  _$PostTypeMeta get PostType => const _$PostTypeMeta();
}

Serializer<PostType> _$postTypeSerializer = new _$PostTypeSerializer();

class _$PostTypeSerializer implements PrimitiveSerializer<PostType> {
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
  final Iterable<Type> types = const <Type>[PostType];
  @override
  final String wireName = 'PostType';

  @override
  Object serialize(Serializers serializers, PostType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PostType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PostType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
