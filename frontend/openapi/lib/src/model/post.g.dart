// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Post extends Post {
  @override
  final String? id;
  @override
  final bool? active;
  @override
  final int? postType;
  @override
  final int? price;
  @override
  final String? userId;
  @override
  final User? user;
  @override
  final String? tags;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final BuiltList<PostImage>? postImages;
  @override
  final DateTime? created;
  @override
  final int? lostItemState;
  @override
  final String? location;
  @override
  final int? borrowDay;

  factory _$Post([void Function(PostBuilder)? updates]) =>
      (new PostBuilder()..update(updates))._build();

  _$Post._(
      {this.id,
      this.active,
      this.postType,
      this.price,
      this.userId,
      this.user,
      this.tags,
      this.title,
      this.body,
      this.postImages,
      this.created,
      this.lostItemState,
      this.location,
      this.borrowDay})
      : super._();

  @override
  Post rebuild(void Function(PostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostBuilder toBuilder() => new PostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
        id == other.id &&
        active == other.active &&
        postType == other.postType &&
        price == other.price &&
        userId == other.userId &&
        user == other.user &&
        tags == other.tags &&
        title == other.title &&
        body == other.body &&
        postImages == other.postImages &&
        created == other.created &&
        lostItemState == other.lostItemState &&
        location == other.location &&
        borrowDay == other.borrowDay;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, postType.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, postImages.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jc(_$hash, lostItemState.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, borrowDay.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Post')
          ..add('id', id)
          ..add('active', active)
          ..add('postType', postType)
          ..add('price', price)
          ..add('userId', userId)
          ..add('user', user)
          ..add('tags', tags)
          ..add('title', title)
          ..add('body', body)
          ..add('postImages', postImages)
          ..add('created', created)
          ..add('lostItemState', lostItemState)
          ..add('location', location)
          ..add('borrowDay', borrowDay))
        .toString();
  }
}

class PostBuilder implements Builder<Post, PostBuilder> {
  _$Post? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  int? _postType;
  int? get postType => _$this._postType;
  set postType(int? postType) => _$this._postType = postType;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  String? _tags;
  String? get tags => _$this._tags;
  set tags(String? tags) => _$this._tags = tags;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  ListBuilder<PostImage>? _postImages;
  ListBuilder<PostImage> get postImages =>
      _$this._postImages ??= new ListBuilder<PostImage>();
  set postImages(ListBuilder<PostImage>? postImages) =>
      _$this._postImages = postImages;

  DateTime? _created;
  DateTime? get created => _$this._created;
  set created(DateTime? created) => _$this._created = created;

  int? _lostItemState;
  int? get lostItemState => _$this._lostItemState;
  set lostItemState(int? lostItemState) =>
      _$this._lostItemState = lostItemState;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  int? _borrowDay;
  int? get borrowDay => _$this._borrowDay;
  set borrowDay(int? borrowDay) => _$this._borrowDay = borrowDay;

  PostBuilder() {
    Post._defaults(this);
  }

  PostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _active = $v.active;
      _postType = $v.postType;
      _price = $v.price;
      _userId = $v.userId;
      _user = $v.user?.toBuilder();
      _tags = $v.tags;
      _title = $v.title;
      _body = $v.body;
      _postImages = $v.postImages?.toBuilder();
      _created = $v.created;
      _lostItemState = $v.lostItemState;
      _location = $v.location;
      _borrowDay = $v.borrowDay;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Post other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Post;
  }

  @override
  void update(void Function(PostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Post build() => _build();

  _$Post _build() {
    _$Post _$result;
    try {
      _$result = _$v ??
          new _$Post._(
              id: id,
              active: active,
              postType: postType,
              price: price,
              userId: userId,
              user: _user?.build(),
              tags: tags,
              title: title,
              body: body,
              postImages: _postImages?.build(),
              created: created,
              lostItemState: lostItemState,
              location: location,
              borrowDay: borrowDay);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();

        _$failedField = 'postImages';
        _postImages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Post', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
