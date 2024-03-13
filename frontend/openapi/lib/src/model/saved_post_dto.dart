//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/post.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'saved_post_dto.g.dart';

/// SavedPostDTO
///
/// Properties:
/// * [id] 
/// * [post] 
@BuiltValue()
abstract class SavedPostDTO implements Built<SavedPostDTO, SavedPostDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'post')
  Post? get post;

  SavedPostDTO._();

  factory SavedPostDTO([void updates(SavedPostDTOBuilder b)]) = _$SavedPostDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SavedPostDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SavedPostDTO> get serializer => _$SavedPostDTOSerializer();
}

class _$SavedPostDTOSerializer implements PrimitiveSerializer<SavedPostDTO> {
  @override
  final Iterable<Type> types = const [SavedPostDTO, _$SavedPostDTO];

  @override
  final String wireName = r'SavedPostDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SavedPostDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.post != null) {
      yield r'post';
      yield serializers.serialize(
        object.post,
        specifiedType: const FullType(Post),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SavedPostDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SavedPostDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'post':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Post),
          ) as Post;
          result.post.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SavedPostDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SavedPostDTOBuilder();
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

