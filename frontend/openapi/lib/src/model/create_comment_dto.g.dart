// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_comment_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateCommentDTO extends CreateCommentDTO {
  @override
  final String? commentedToUserId;
  @override
  final String? userId;
  @override
  final String? text;

  factory _$CreateCommentDTO(
          [void Function(CreateCommentDTOBuilder)? updates]) =>
      (new CreateCommentDTOBuilder()..update(updates))._build();

  _$CreateCommentDTO._({this.commentedToUserId, this.userId, this.text})
      : super._();

  @override
  CreateCommentDTO rebuild(void Function(CreateCommentDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateCommentDTOBuilder toBuilder() =>
      new CreateCommentDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateCommentDTO &&
        commentedToUserId == other.commentedToUserId &&
        userId == other.userId &&
        text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, commentedToUserId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateCommentDTO')
          ..add('commentedToUserId', commentedToUserId)
          ..add('userId', userId)
          ..add('text', text))
        .toString();
  }
}

class CreateCommentDTOBuilder
    implements Builder<CreateCommentDTO, CreateCommentDTOBuilder> {
  _$CreateCommentDTO? _$v;

  String? _commentedToUserId;
  String? get commentedToUserId => _$this._commentedToUserId;
  set commentedToUserId(String? commentedToUserId) =>
      _$this._commentedToUserId = commentedToUserId;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  CreateCommentDTOBuilder() {
    CreateCommentDTO._defaults(this);
  }

  CreateCommentDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _commentedToUserId = $v.commentedToUserId;
      _userId = $v.userId;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateCommentDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateCommentDTO;
  }

  @override
  void update(void Function(CreateCommentDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateCommentDTO build() => _build();

  _$CreateCommentDTO _build() {
    final _$result = _$v ??
        new _$CreateCommentDTO._(
            commentedToUserId: commentedToUserId, userId: userId, text: text);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
