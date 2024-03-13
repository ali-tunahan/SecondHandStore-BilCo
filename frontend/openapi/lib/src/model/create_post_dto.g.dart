// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreatePostDTO extends CreatePostDTO {
  @override
  final int? postType;
  @override
  final String? userId;
  @override
  final String? tags;
  @override
  final int? price;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final BuiltList<String>? postImages;
  @override
  final int? lostItemState;
  @override
  final String? location;
  @override
  final int? borrowDay;

  factory _$CreatePostDTO([void Function(CreatePostDTOBuilder)? updates]) =>
      (new CreatePostDTOBuilder()..update(updates))._build();

  _$CreatePostDTO._(
      {this.postType,
      this.userId,
      this.tags,
      this.price,
      this.title,
      this.body,
      this.postImages,
      this.lostItemState,
      this.location,
      this.borrowDay})
      : super._();

  @override
  CreatePostDTO rebuild(void Function(CreatePostDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePostDTOBuilder toBuilder() => new CreatePostDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePostDTO &&
        postType == other.postType &&
        userId == other.userId &&
        tags == other.tags &&
        price == other.price &&
        title == other.title &&
        body == other.body &&
        postImages == other.postImages &&
        lostItemState == other.lostItemState &&
        location == other.location &&
        borrowDay == other.borrowDay;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, postType.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, postImages.hashCode);
    _$hash = $jc(_$hash, lostItemState.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, borrowDay.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatePostDTO')
          ..add('postType', postType)
          ..add('userId', userId)
          ..add('tags', tags)
          ..add('price', price)
          ..add('title', title)
          ..add('body', body)
          ..add('postImages', postImages)
          ..add('lostItemState', lostItemState)
          ..add('location', location)
          ..add('borrowDay', borrowDay))
        .toString();
  }
}

class CreatePostDTOBuilder
    implements Builder<CreatePostDTO, CreatePostDTOBuilder> {
  _$CreatePostDTO? _$v;

  int? _postType;
  int? get postType => _$this._postType;
  set postType(int? postType) => _$this._postType = postType;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _tags;
  String? get tags => _$this._tags;
  set tags(String? tags) => _$this._tags = tags;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  ListBuilder<String>? _postImages;
  ListBuilder<String> get postImages =>
      _$this._postImages ??= new ListBuilder<String>();
  set postImages(ListBuilder<String>? postImages) =>
      _$this._postImages = postImages;

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

  CreatePostDTOBuilder() {
    CreatePostDTO._defaults(this);
  }

  CreatePostDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postType = $v.postType;
      _userId = $v.userId;
      _tags = $v.tags;
      _price = $v.price;
      _title = $v.title;
      _body = $v.body;
      _postImages = $v.postImages?.toBuilder();
      _lostItemState = $v.lostItemState;
      _location = $v.location;
      _borrowDay = $v.borrowDay;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePostDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreatePostDTO;
  }

  @override
  void update(void Function(CreatePostDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatePostDTO build() => _build();

  _$CreatePostDTO _build() {
    _$CreatePostDTO _$result;
    try {
      _$result = _$v ??
          new _$CreatePostDTO._(
              postType: postType,
              userId: userId,
              tags: tags,
              price: price,
              title: title,
              body: body,
              postImages: _postImages?.build(),
              lostItemState: lostItemState,
              location: location,
              borrowDay: borrowDay);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'postImages';
        _postImages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreatePostDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
