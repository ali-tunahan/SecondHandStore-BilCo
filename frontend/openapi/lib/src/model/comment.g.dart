// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Comment extends Comment {
  @override
  final String? id;
  @override
  final String? userId;
  @override
  final User? user;
  @override
  final String? commentedToUserId;
  @override
  final User? commentedToUser;
  @override
  final String? text;
  @override
  final DateTime? created;
  @override
  final DateTime? updated;

  factory _$Comment([void Function(CommentBuilder)? updates]) =>
      (new CommentBuilder()..update(updates))._build();

  _$Comment._(
      {this.id,
      this.userId,
      this.user,
      this.commentedToUserId,
      this.commentedToUser,
      this.text,
      this.created,
      this.updated})
      : super._();

  @override
  Comment rebuild(void Function(CommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentBuilder toBuilder() => new CommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Comment &&
        id == other.id &&
        userId == other.userId &&
        user == other.user &&
        commentedToUserId == other.commentedToUserId &&
        commentedToUser == other.commentedToUser &&
        text == other.text &&
        created == other.created &&
        updated == other.updated;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, commentedToUserId.hashCode);
    _$hash = $jc(_$hash, commentedToUser.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jc(_$hash, updated.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Comment')
          ..add('id', id)
          ..add('userId', userId)
          ..add('user', user)
          ..add('commentedToUserId', commentedToUserId)
          ..add('commentedToUser', commentedToUser)
          ..add('text', text)
          ..add('created', created)
          ..add('updated', updated))
        .toString();
  }
}

class CommentBuilder implements Builder<Comment, CommentBuilder> {
  _$Comment? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  String? _commentedToUserId;
  String? get commentedToUserId => _$this._commentedToUserId;
  set commentedToUserId(String? commentedToUserId) =>
      _$this._commentedToUserId = commentedToUserId;

  UserBuilder? _commentedToUser;
  UserBuilder get commentedToUser =>
      _$this._commentedToUser ??= new UserBuilder();
  set commentedToUser(UserBuilder? commentedToUser) =>
      _$this._commentedToUser = commentedToUser;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  DateTime? _created;
  DateTime? get created => _$this._created;
  set created(DateTime? created) => _$this._created = created;

  DateTime? _updated;
  DateTime? get updated => _$this._updated;
  set updated(DateTime? updated) => _$this._updated = updated;

  CommentBuilder() {
    Comment._defaults(this);
  }

  CommentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _user = $v.user?.toBuilder();
      _commentedToUserId = $v.commentedToUserId;
      _commentedToUser = $v.commentedToUser?.toBuilder();
      _text = $v.text;
      _created = $v.created;
      _updated = $v.updated;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Comment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Comment;
  }

  @override
  void update(void Function(CommentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Comment build() => _build();

  _$Comment _build() {
    _$Comment _$result;
    try {
      _$result = _$v ??
          new _$Comment._(
              id: id,
              userId: userId,
              user: _user?.build(),
              commentedToUserId: commentedToUserId,
              commentedToUser: _commentedToUser?.build(),
              text: text,
              created: created,
              updated: updated);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();

        _$failedField = 'commentedToUser';
        _commentedToUser?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Comment', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
