// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_image.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostImage extends PostImage {
  @override
  final String? id;
  @override
  final String? imageName;
  @override
  final String? imageUrl;
  @override
  final int? order;
  @override
  final String? postId;

  factory _$PostImage([void Function(PostImageBuilder)? updates]) =>
      (new PostImageBuilder()..update(updates))._build();

  _$PostImage._(
      {this.id, this.imageName, this.imageUrl, this.order, this.postId})
      : super._();

  @override
  PostImage rebuild(void Function(PostImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostImageBuilder toBuilder() => new PostImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostImage &&
        id == other.id &&
        imageName == other.imageName &&
        imageUrl == other.imageUrl &&
        order == other.order &&
        postId == other.postId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, imageName.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, postId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostImage')
          ..add('id', id)
          ..add('imageName', imageName)
          ..add('imageUrl', imageUrl)
          ..add('order', order)
          ..add('postId', postId))
        .toString();
  }
}

class PostImageBuilder implements Builder<PostImage, PostImageBuilder> {
  _$PostImage? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _imageName;
  String? get imageName => _$this._imageName;
  set imageName(String? imageName) => _$this._imageName = imageName;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  int? _order;
  int? get order => _$this._order;
  set order(int? order) => _$this._order = order;

  String? _postId;
  String? get postId => _$this._postId;
  set postId(String? postId) => _$this._postId = postId;

  PostImageBuilder() {
    PostImage._defaults(this);
  }

  PostImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _imageName = $v.imageName;
      _imageUrl = $v.imageUrl;
      _order = $v.order;
      _postId = $v.postId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostImage;
  }

  @override
  void update(void Function(PostImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostImage build() => _build();

  _$PostImage _build() {
    final _$result = _$v ??
        new _$PostImage._(
            id: id,
            imageName: imageName,
            imageUrl: imageUrl,
            order: order,
            postId: postId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
