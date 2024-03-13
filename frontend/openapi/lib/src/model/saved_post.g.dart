// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_post.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SavedPost extends SavedPost {
  @override
  final String? id;
  @override
  final String? postId;
  @override
  final Post? post;
  @override
  final String? userId;
  @override
  final User? user;

  factory _$SavedPost([void Function(SavedPostBuilder)? updates]) =>
      (new SavedPostBuilder()..update(updates))._build();

  _$SavedPost._({this.id, this.postId, this.post, this.userId, this.user})
      : super._();

  @override
  SavedPost rebuild(void Function(SavedPostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SavedPostBuilder toBuilder() => new SavedPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SavedPost &&
        id == other.id &&
        postId == other.postId &&
        post == other.post &&
        userId == other.userId &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, postId.hashCode);
    _$hash = $jc(_$hash, post.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SavedPost')
          ..add('id', id)
          ..add('postId', postId)
          ..add('post', post)
          ..add('userId', userId)
          ..add('user', user))
        .toString();
  }
}

class SavedPostBuilder implements Builder<SavedPost, SavedPostBuilder> {
  _$SavedPost? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _postId;
  String? get postId => _$this._postId;
  set postId(String? postId) => _$this._postId = postId;

  PostBuilder? _post;
  PostBuilder get post => _$this._post ??= new PostBuilder();
  set post(PostBuilder? post) => _$this._post = post;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  SavedPostBuilder() {
    SavedPost._defaults(this);
  }

  SavedPostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _postId = $v.postId;
      _post = $v.post?.toBuilder();
      _userId = $v.userId;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SavedPost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SavedPost;
  }

  @override
  void update(void Function(SavedPostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SavedPost build() => _build();

  _$SavedPost _build() {
    _$SavedPost _$result;
    try {
      _$result = _$v ??
          new _$SavedPost._(
              id: id,
              postId: postId,
              post: _post?.build(),
              userId: userId,
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'post';
        _post?.build();

        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SavedPost', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
