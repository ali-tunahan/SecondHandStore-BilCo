//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_comment_dto.g.dart';

/// CreateCommentDTO
///
/// Properties:
/// * [commentedToUserId] 
/// * [userId] 
/// * [text] 
@BuiltValue()
abstract class CreateCommentDTO implements Built<CreateCommentDTO, CreateCommentDTOBuilder> {
  @BuiltValueField(wireName: r'commentedToUserId')
  String? get commentedToUserId;

  @BuiltValueField(wireName: r'userId')
  String? get userId;

  @BuiltValueField(wireName: r'text')
  String? get text;

  CreateCommentDTO._();

  factory CreateCommentDTO([void updates(CreateCommentDTOBuilder b)]) = _$CreateCommentDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateCommentDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateCommentDTO> get serializer => _$CreateCommentDTOSerializer();
}

class _$CreateCommentDTOSerializer implements PrimitiveSerializer<CreateCommentDTO> {
  @override
  final Iterable<Type> types = const [CreateCommentDTO, _$CreateCommentDTO];

  @override
  final String wireName = r'CreateCommentDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateCommentDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.commentedToUserId != null) {
      yield r'commentedToUserId';
      yield serializers.serialize(
        object.commentedToUserId,
        specifiedType: const FullType(String),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(String),
      );
    }
    if (object.text != null) {
      yield r'text';
      yield serializers.serialize(
        object.text,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateCommentDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateCommentDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'commentedToUserId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.commentedToUserId = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.text = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateCommentDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateCommentDTOBuilder();
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

