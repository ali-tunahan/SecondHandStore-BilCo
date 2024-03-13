//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authorize_request.g.dart';

/// AuthorizeRequest
///
/// Properties:
/// * [userName] 
/// * [password] 
@BuiltValue()
abstract class AuthorizeRequest implements Built<AuthorizeRequest, AuthorizeRequestBuilder> {
  @BuiltValueField(wireName: r'userName')
  String? get userName;

  @BuiltValueField(wireName: r'password')
  String? get password;

  AuthorizeRequest._();

  factory AuthorizeRequest([void updates(AuthorizeRequestBuilder b)]) = _$AuthorizeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthorizeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthorizeRequest> get serializer => _$AuthorizeRequestSerializer();
}

class _$AuthorizeRequestSerializer implements PrimitiveSerializer<AuthorizeRequest> {
  @override
  final Iterable<Type> types = const [AuthorizeRequest, _$AuthorizeRequest];

  @override
  final String wireName = r'AuthorizeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthorizeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userName != null) {
      yield r'userName';
      yield serializers.serialize(
        object.userName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.password != null) {
      yield r'password';
      yield serializers.serialize(
        object.password,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthorizeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthorizeRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'userName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userName = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.password = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuthorizeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthorizeRequestBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

