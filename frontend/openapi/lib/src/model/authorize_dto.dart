//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authorize_dto.g.dart';

/// AuthorizeDTO
///
/// Properties:
/// * [userId] 
/// * [accessToken] 
/// * [refreshToken] 
/// * [refreshTokenExpires] 
/// * [isAuthorized] 
@BuiltValue()
abstract class AuthorizeDTO implements Built<AuthorizeDTO, AuthorizeDTOBuilder> {
  @BuiltValueField(wireName: r'userId')
  String? get userId;

  @BuiltValueField(wireName: r'accessToken')
  String? get accessToken;

  @BuiltValueField(wireName: r'refreshToken')
  String? get refreshToken;

  @BuiltValueField(wireName: r'refreshTokenExpires')
  DateTime? get refreshTokenExpires;

  @BuiltValueField(wireName: r'isAuthorized')
  bool? get isAuthorized;

  AuthorizeDTO._();

  factory AuthorizeDTO([void updates(AuthorizeDTOBuilder b)]) = _$AuthorizeDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthorizeDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthorizeDTO> get serializer => _$AuthorizeDTOSerializer();
}

class _$AuthorizeDTOSerializer implements PrimitiveSerializer<AuthorizeDTO> {
  @override
  final Iterable<Type> types = const [AuthorizeDTO, _$AuthorizeDTO];

  @override
  final String wireName = r'AuthorizeDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthorizeDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.accessToken != null) {
      yield r'accessToken';
      yield serializers.serialize(
        object.accessToken,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.refreshToken != null) {
      yield r'refreshToken';
      yield serializers.serialize(
        object.refreshToken,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.refreshTokenExpires != null) {
      yield r'refreshTokenExpires';
      yield serializers.serialize(
        object.refreshTokenExpires,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.isAuthorized != null) {
      yield r'isAuthorized';
      yield serializers.serialize(
        object.isAuthorized,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthorizeDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthorizeDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'accessToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.accessToken = valueDes;
          break;
        case r'refreshToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.refreshToken = valueDes;
          break;
        case r'refreshTokenExpires':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.refreshTokenExpires = valueDes;
          break;
        case r'isAuthorized':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isAuthorized = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuthorizeDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthorizeDTOBuilder();
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

