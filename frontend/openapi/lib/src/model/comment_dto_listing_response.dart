//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/comment_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment_dto_listing_response.g.dart';

/// CommentDTOListingResponse
///
/// Properties:
/// * [data] 
/// * [totalCount] 
/// * [startIndex] 
/// * [dataCount] 
@BuiltValue()
abstract class CommentDTOListingResponse implements Built<CommentDTOListingResponse, CommentDTOListingResponseBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<CommentDTO>? get data;

  @BuiltValueField(wireName: r'totalCount')
  int? get totalCount;

  @BuiltValueField(wireName: r'startIndex')
  int? get startIndex;

  @BuiltValueField(wireName: r'dataCount')
  int? get dataCount;

  CommentDTOListingResponse._();

  factory CommentDTOListingResponse([void updates(CommentDTOListingResponseBuilder b)]) = _$CommentDTOListingResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CommentDTOListingResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CommentDTOListingResponse> get serializer => _$CommentDTOListingResponseSerializer();
}

class _$CommentDTOListingResponseSerializer implements PrimitiveSerializer<CommentDTOListingResponse> {
  @override
  final Iterable<Type> types = const [CommentDTOListingResponse, _$CommentDTOListingResponse];

  @override
  final String wireName = r'CommentDTOListingResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CommentDTOListingResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType.nullable(BuiltList, [FullType(CommentDTO)]),
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
    CommentDTOListingResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CommentDTOListingResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CommentDTO)]),
          ) as BuiltList<CommentDTO>?;
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
  CommentDTOListingResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommentDTOListingResponseBuilder();
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

