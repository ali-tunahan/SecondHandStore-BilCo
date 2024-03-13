//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_demo_dto.g.dart';

/// CreateDemoDTO
///
/// Properties:
/// * [name] 
/// * [parentId] 
@BuiltValue()
abstract class CreateDemoDTO implements Built<CreateDemoDTO, CreateDemoDTOBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'parentId')
  String? get parentId;

  CreateDemoDTO._();

  factory CreateDemoDTO([void updates(CreateDemoDTOBuilder b)]) = _$CreateDemoDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateDemoDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateDemoDTO> get serializer => _$CreateDemoDTOSerializer();
}

class _$CreateDemoDTOSerializer implements PrimitiveSerializer<CreateDemoDTO> {
  @override
  final Iterable<Type> types = const [CreateDemoDTO, _$CreateDemoDTO];

  @override
  final String wireName = r'CreateDemoDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateDemoDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.parentId != null) {
      yield r'parentId';
      yield serializers.serialize(
        object.parentId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateDemoDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateDemoDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'parentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.parentId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateDemoDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateDemoDTOBuilder();
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

