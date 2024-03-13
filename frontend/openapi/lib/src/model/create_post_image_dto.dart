//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'dart:typed_data';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_post_image_dto.g.dart';

/// CreatePostImageDTO
///
/// Properties:
/// * [imageName] 
/// * [imageFile] 
/// * [order] 
@BuiltValue()
abstract class CreatePostImageDTO implements Built<CreatePostImageDTO, CreatePostImageDTOBuilder> {
  @BuiltValueField(wireName: r'imageName')
  String? get imageName;

  @BuiltValueField(wireName: r'imageFile')
  Uint8List? get imageFile;

  @BuiltValueField(wireName: r'order')
  int? get order;

  CreatePostImageDTO._();

  factory CreatePostImageDTO([void updates(CreatePostImageDTOBuilder b)]) = _$CreatePostImageDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreatePostImageDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreatePostImageDTO> get serializer => _$CreatePostImageDTOSerializer();
}

class _$CreatePostImageDTOSerializer implements PrimitiveSerializer<CreatePostImageDTO> {
  @override
  final Iterable<Type> types = const [CreatePostImageDTO, _$CreatePostImageDTO];

  @override
  final String wireName = r'CreatePostImageDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreatePostImageDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.imageName != null) {
      yield r'imageName';
      yield serializers.serialize(
        object.imageName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.imageFile != null) {
      yield r'imageFile';
      yield serializers.serialize(
        object.imageFile,
        specifiedType: const FullType.nullable(Uint8List),
      );
    }
    if (object.order != null) {
      yield r'order';
      yield serializers.serialize(
        object.order,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreatePostImageDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreatePostImageDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'imageName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.imageName = valueDes;
          break;
        case r'imageFile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Uint8List),
          ) as Uint8List?;
          if (valueDes == null) continue;
          result.imageFile = valueDes;
          break;
        case r'order':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.order = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreatePostImageDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreatePostImageDTOBuilder();
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

