// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_post_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SavedPostDTO extends SavedPostDTO {
  @override
  final String? id;
  @override
  final Post? post;

  factory _$SavedPostDTO([void Function(SavedPostDTOBuilder)? updates]) =>
      (new SavedPostDTOBuilder()..update(updates))._build();

  _$SavedPostDTO._({this.id, this.post}) : super._();

  @override
  SavedPostDTO rebuild(void Function(SavedPostDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SavedPostDTOBuilder toBuilder() => new SavedPostDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SavedPostDTO && id == other.id && post == other.post;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, post.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SavedPostDTO')
          ..add('id', id)
          ..add('post', post))
        .toString();
  }
}

class SavedPostDTOBuilder
    implements Builder<SavedPostDTO, SavedPostDTOBuilder> {
  _$SavedPostDTO? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  PostBuilder? _post;
  PostBuilder get post => _$this._post ??= new PostBuilder();
  set post(PostBuilder? post) => _$this._post = post;

  SavedPostDTOBuilder() {
    SavedPostDTO._defaults(this);
  }

  SavedPostDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _post = $v.post?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SavedPostDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SavedPostDTO;
  }

  @override
  void update(void Function(SavedPostDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SavedPostDTO build() => _build();

  _$SavedPostDTO _build() {
    _$SavedPostDTO _$result;
    try {
      _$result = _$v ?? new _$SavedPostDTO._(id: id, post: _post?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'post';
        _post?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SavedPostDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
