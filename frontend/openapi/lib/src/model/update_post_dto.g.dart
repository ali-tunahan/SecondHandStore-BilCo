// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_post_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdatePostDTO extends UpdatePostDTO {
  @override
  final String? id;
  @override
  final bool? active;
  @override
  final int? postType;
  @override
  final int? price;
  @override
  final String? tags;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final DateTime? created;
  @override
  final BuiltList<String>? postImages;
  @override
  final int? lostItemState;

  factory _$UpdatePostDTO([void Function(UpdatePostDTOBuilder)? updates]) =>
      (new UpdatePostDTOBuilder()..update(updates))._build();

  _$UpdatePostDTO._(
      {this.id,
      this.active,
      this.postType,
      this.price,
      this.tags,
      this.title,
      this.body,
      this.created,
      this.postImages,
      this.lostItemState})
      : super._();

  @override
  UpdatePostDTO rebuild(void Function(UpdatePostDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdatePostDTOBuilder toBuilder() => new UpdatePostDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdatePostDTO &&
        id == other.id &&
        active == other.active &&
        postType == other.postType &&
        price == other.price &&
        tags == other.tags &&
        title == other.title &&
        body == other.body &&
        created == other.created &&
        postImages == other.postImages &&
        lostItemState == other.lostItemState;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, postType.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jc(_$hash, postImages.hashCode);
    _$hash = $jc(_$hash, lostItemState.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdatePostDTO')
          ..add('id', id)
          ..add('active', active)
          ..add('postType', postType)
          ..add('price', price)
          ..add('tags', tags)
          ..add('title', title)
          ..add('body', body)
          ..add('created', created)
          ..add('postImages', postImages)
          ..add('lostItemState', lostItemState))
        .toString();
  }
}

class UpdatePostDTOBuilder
    implements Builder<UpdatePostDTO, UpdatePostDTOBuilder> {
  _$UpdatePostDTO? _$v;

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

  String? _tags;
  String? get tags => _$this._tags;
  set tags(String? tags) => _$this._tags = tags;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  DateTime? _created;
  DateTime? get created => _$this._created;
  set created(DateTime? created) => _$this._created = created;

  ListBuilder<String>? _postImages;
  ListBuilder<String> get postImages =>
      _$this._postImages ??= new ListBuilder<String>();
  set postImages(ListBuilder<String>? postImages) =>
      _$this._postImages = postImages;

  int? _lostItemState;
  int? get lostItemState => _$this._lostItemState;
  set lostItemState(int? lostItemState) =>
      _$this._lostItemState = lostItemState;

  UpdatePostDTOBuilder() {
    UpdatePostDTO._defaults(this);
  }

  UpdatePostDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _active = $v.active;
      _postType = $v.postType;
      _price = $v.price;
      _tags = $v.tags;
      _title = $v.title;
      _body = $v.body;
      _created = $v.created;
      _postImages = $v.postImages?.toBuilder();
      _lostItemState = $v.lostItemState;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdatePostDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdatePostDTO;
  }

  @override
  void update(void Function(UpdatePostDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdatePostDTO build() => _build();

  _$UpdatePostDTO _build() {
    _$UpdatePostDTO _$result;
    try {
      _$result = _$v ??
          new _$UpdatePostDTO._(
              id: id,
              active: active,
              postType: postType,
              price: price,
              tags: tags,
              title: title,
              body: body,
              created: created,
              postImages: _postImages?.build(),
              lostItemState: lostItemState);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'postImages';
        _postImages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdatePostDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
