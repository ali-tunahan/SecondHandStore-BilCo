// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_demo_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateDemoDTO extends CreateDemoDTO {
  @override
  final String? name;
  @override
  final String? parentId;

  factory _$CreateDemoDTO([void Function(CreateDemoDTOBuilder)? updates]) =>
      (new CreateDemoDTOBuilder()..update(updates))._build();

  _$CreateDemoDTO._({this.name, this.parentId}) : super._();

  @override
  CreateDemoDTO rebuild(void Function(CreateDemoDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateDemoDTOBuilder toBuilder() => new CreateDemoDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateDemoDTO &&
        name == other.name &&
        parentId == other.parentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, parentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateDemoDTO')
          ..add('name', name)
          ..add('parentId', parentId))
        .toString();
  }
}

class CreateDemoDTOBuilder
    implements Builder<CreateDemoDTO, CreateDemoDTOBuilder> {
  _$CreateDemoDTO? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _parentId;
  String? get parentId => _$this._parentId;
  set parentId(String? parentId) => _$this._parentId = parentId;

  CreateDemoDTOBuilder() {
    CreateDemoDTO._defaults(this);
  }

  CreateDemoDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _parentId = $v.parentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateDemoDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateDemoDTO;
  }

  @override
  void update(void Function(CreateDemoDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateDemoDTO build() => _build();

  _$CreateDemoDTO _build() {
    final _$result =
        _$v ?? new _$CreateDemoDTO._(name: name, parentId: parentId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
