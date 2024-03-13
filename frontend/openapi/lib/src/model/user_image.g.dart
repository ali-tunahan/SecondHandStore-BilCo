// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_image.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserImage extends UserImage {
  @override
  final String? id;
  @override
  final String? imageName;
  @override
  final String? imageUrl;
  @override
  final String? userId;

  factory _$UserImage([void Function(UserImageBuilder)? updates]) =>
      (new UserImageBuilder()..update(updates))._build();

  _$UserImage._({this.id, this.imageName, this.imageUrl, this.userId})
      : super._();

  @override
  UserImage rebuild(void Function(UserImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserImageBuilder toBuilder() => new UserImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserImage &&
        id == other.id &&
        imageName == other.imageName &&
        imageUrl == other.imageUrl &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, imageName.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserImage')
          ..add('id', id)
          ..add('imageName', imageName)
          ..add('imageUrl', imageUrl)
          ..add('userId', userId))
        .toString();
  }
}

class UserImageBuilder implements Builder<UserImage, UserImageBuilder> {
  _$UserImage? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _imageName;
  String? get imageName => _$this._imageName;
  set imageName(String? imageName) => _$this._imageName = imageName;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  UserImageBuilder() {
    UserImage._defaults(this);
  }

  UserImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _imageName = $v.imageName;
      _imageUrl = $v.imageUrl;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserImage;
  }

  @override
  void update(void Function(UserImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserImage build() => _build();

  _$UserImage _build() {
    final _$result = _$v ??
        new _$UserImage._(
            id: id, imageName: imageName, imageUrl: imageUrl, userId: userId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
