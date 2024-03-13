//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/post_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_dto_listing_response.g.dart';

/// PostDTOListingResponse
///
/// Properties:
/// * [data] 
/// * [totalCount] 
/// * [startIndex] 
/// * [dataCount] 
@BuiltValue()
abstract class PostDTOListingResponse implements Built<PostDTOListingResponse, PostDTOListingResponseBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<PostDTO>? get data;

  @BuiltValueField(wireName: r'totalCount')
  int? get totalCount;

  @BuiltValueField(wireName: r'startIndex')
  int? get startIndex;

  @BuiltValueField(wireName: r'dataCount')
  int? get dataCount;

  PostDTOListingResponse._();

  factory PostDTOListingResponse([void updates(PostDTOListingResponseBuilder b)]) = _$PostDTOListingResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostDTOListingResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostDTOListingResponse> get serializer => _$PostDTOListingResponseSerializer();
}

class _$PostDTOListingResponseSerializer implements PrimitiveSerializer<PostDTOListingResponse> {
  @override
  final Iterable<Type> types = const [PostDTOListingResponse, _$PostDTOListingResponse];

  @override
  final String wireName = r'PostDTOListingResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostDTOListingResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType.nullable(BuiltList, [FullType(PostDTO)]),
      );
    }
    if (object.totalCount != null) {
      yield r'totalCount';
      yield serializers.serialize(
        object.totalCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.startIndex != null) {
      yield r'startIndex';
      yield serializers.serialize(
        object.startIndex,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.dataCount != null) {
      yield r'dataCount';
      yield serializers.serialize(
        object.dataCount,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PostDTOListingResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostDTOListingResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(PostDTO)]),
          ) as BuiltList<PostDTO>?;
          if (valueDes == null) continue;
          result.data.replace(valueDes);
          break;
        case r'totalCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalCount = valueDes;
          break;
        case r'startIndex':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.startIndex = valueDes;
          break;
        case r'dataCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.dataCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostDTOListingResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostDTOListingResponseBuilder();
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

