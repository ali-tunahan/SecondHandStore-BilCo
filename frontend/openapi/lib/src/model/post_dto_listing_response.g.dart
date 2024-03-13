// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto_listing_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostDTOListingResponse extends PostDTOListingResponse {
  @override
  final BuiltList<PostDTO>? data;
  @override
  final int? totalCount;
  @override
  final int? startIndex;
  @override
  final int? dataCount;

  factory _$PostDTOListingResponse(
          [void Function(PostDTOListingResponseBuilder)? updates]) =>
      (new PostDTOListingResponseBuilder()..update(updates))._build();

  _$PostDTOListingResponse._(
      {this.data, this.totalCount, this.startIndex, this.dataCount})
      : super._();

  @override
  PostDTOListingResponse rebuild(
          void Function(PostDTOListingResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostDTOListingResponseBuilder toBuilder() =>
      new PostDTOListingResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostDTOListingResponse &&
        data == other.data &&
        totalCount == other.totalCount &&
        startIndex == other.startIndex &&
        dataCount == other.dataCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, totalCount.hashCode);
    _$hash = $jc(_$hash, startIndex.hashCode);
    _$hash = $jc(_$hash, dataCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostDTOListingResponse')
          ..add('data', data)
          ..add('totalCount', totalCount)
          ..add('startIndex', startIndex)
          ..add('dataCount', dataCount))
        .toString();
  }
}

class PostDTOListingResponseBuilder
    implements Builder<PostDTOListingResponse, PostDTOListingResponseBuilder> {
  _$PostDTOListingResponse? _$v;

  ListBuilder<PostDTO>? _data;
  ListBuilder<PostDTO> get data => _$this._data ??= new ListBuilder<PostDTO>();
  set data(ListBuilder<PostDTO>? data) => _$this._data = data;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  int? _startIndex;
  int? get startIndex => _$this._startIndex;
  set startIndex(int? startIndex) => _$this._startIndex = startIndex;

  int? _dataCount;
  int? get dataCount => _$this._dataCount;
  set dataCount(int? dataCount) => _$this._dataCount = dataCount;

  PostDTOListingResponseBuilder() {
    PostDTOListingResponse._defaults(this);
  }

  PostDTOListingResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _totalCount = $v.totalCount;
      _startIndex = $v.startIndex;
      _dataCount = $v.dataCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostDTOListingResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostDTOListingResponse;
  }

  @override
  void update(void Function(PostDTOListingResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostDTOListingResponse build() => _build();

  _$PostDTOListingResponse _build() {
    _$PostDTOListingResponse _$result;
    try {
      _$result = _$v ??
          new _$PostDTOListingResponse._(
              data: _data?.build(),
              totalCount: totalCount,
              startIndex: startIndex,
              dataCount: dataCount);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostDTOListingResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
