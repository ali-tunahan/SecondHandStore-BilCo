// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommentDTO extends CommentDTO {
  @override
  final String? id;
  @override
  final UserDTO? user;
  @override
  final String? text;
  @override
  final DateTime? created;
  @override
  final DateTime? updated;

  factory _$CommentDTO([void Function(CommentDTOBuilder)? updates]) =>
      (new CommentDTOBuilder()..update(updates))._build();

  _$CommentDTO._({this.id, this.user, this.text, this.created, this.updated})
      : super._();

  @override
  CommentDTO rebuild(void Function(CommentDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentDTOBuilder toBuilder() => new CommentDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentDTO &&
        id == other.id &&
        user == other.user &&
        text == other.text &&
        created == other.created &&
        updated == other.updated;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jc(_$hash, updated.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentDTO')
          ..add('id', id)
          ..add('user', user)
          ..add('text', text)
          ..add('created', created)
          ..add('updated', updated))
        .toString();
  }
}

class CommentDTOBuilder implements Builder<CommentDTO, CommentDTOBuilder> {
  _$CommentDTO? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  UserDTOBuilder? _user;
  UserDTOBuilder get user => _$this._user ??= new UserDTOBuilder();
  set user(UserDTOBuilder? user) => _$this._user = user;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  DateTime? _created;
  DateTime? get created => _$this._created;
  set created(DateTime? created) => _$this._created = created;

  DateTime? _updated;
  DateTime? get updated => _$this._updated;
  set updated(DateTime? updated) => _$this._updated = updated;

  CommentDTOBuilder() {
    CommentDTO._defaults(this);
  }

  CommentDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _user = $v.user?.toBuilder();
      _text = $v.text;
      _created = $v.created;
      _updated = $v.updated;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentDTO;
  }

  @override
  void update(void Function(CommentDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentDTO build() => _build();

  _$CommentDTO _build() {
    _$CommentDTO _$result;
    try {
      _$result = _$v ??
          new _$CommentDTO._(
              id: id,
              user: _user?.build(),
              text: text,
              created: created,
              updated: updated);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CommentDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
