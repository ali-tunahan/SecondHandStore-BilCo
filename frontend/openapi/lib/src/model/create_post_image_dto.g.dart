// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_image_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreatePostImageDTO extends CreatePostImageDTO {
  @override
  final String? imageName;
  @override
  final Uint8List? imageFile;
  @override
  final int? order;

  factory _$CreatePostImageDTO(
          [void Function(CreatePostImageDTOBuilder)? updates]) =>
      (new CreatePostImageDTOBuilder()..update(updates))._build();

  _$CreatePostImageDTO._({this.imageName, this.imageFile, this.order})
      : super._();

  @override
  CreatePostImageDTO rebuild(
          void Function(CreatePostImageDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePostImageDTOBuilder toBuilder() =>
      new CreatePostImageDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePostImageDTO &&
        imageName == other.imageName &&
        imageFile == other.imageFile &&
        order == other.order;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, imageName.hashCode);
    _$hash = $jc(_$hash, imageFile.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatePostImageDTO')
          ..add('imageName', imageName)
          ..add('imageFile', imageFile)
          ..add('order', order))
        .toString();
  }
}

class CreatePostImageDTOBuilder
    implements Builder<CreatePostImageDTO, CreatePostImageDTOBuilder> {
  _$CreatePostImageDTO? _$v;

  String? _imageName;
  String? get imageName => _$this._imageName;
  set imageName(String? imageName) => _$this._imageName = imageName;

  Uint8List? _imageFile;
  Uint8List? get imageFile => _$this._imageFile;
  set imageFile(Uint8List? imageFile) => _$this._imageFile = imageFile;

  int? _order;
  int? get order => _$this._order;
  set order(int? order) => _$this._order = order;

  CreatePostImageDTOBuilder() {
    CreatePostImageDTO._defaults(this);
  }

  CreatePostImageDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageName = $v.imageName;
      _imageFile = $v.imageFile;
      _order = $v.order;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePostImageDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreatePostImageDTO;
  }

  @override
  void update(void Function(CreatePostImageDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatePostImageDTO build() => _build();

  _$CreatePostImageDTO _build() {
    final _$result = _$v ??
        new _$CreatePostImageDTO._(
            imageName: imageName, imageFile: imageFile, order: order);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
