// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto_listing_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommentDTOListingResponse extends CommentDTOListingResponse {
  @override
  final BuiltList<CommentDTO>? data;
  @override
  final int? totalCount;
  @override
  final int? startIndex;
  @override
  final int? dataCount;

  factory _$CommentDTOListingResponse(
          [void Function(CommentDTOListingResponseBuilder)? updates]) =>
      (new CommentDTOListingResponseBuilder()..update(updates))._build();

  _$CommentDTOListingResponse._(
      {this.data, this.totalCount, this.startIndex, this.dataCount})
      : super._();

  @override
  CommentDTOListingResponse rebuild(
          void Function(CommentDTOListingResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentDTOListingResponseBuilder toBuilder() =>
      new CommentDTOListingResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentDTOListingResponse &&
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
    return (newBuiltValueToStringHelper(r'CommentDTOListingResponse')
          ..add('data', data)
          ..add('totalCount', totalCount)
          ..add('startIndex', startIndex)
          ..add('dataCount', dataCount))
        .toString();
  }
}

class CommentDTOListingResponseBuilder
    implements
        Builder<CommentDTOListingResponse, CommentDTOListingResponseBuilder> {
  _$CommentDTOListingResponse? _$v;

  ListBuilder<CommentDTO>? _data;
  ListBuilder<CommentDTO> get data =>
      _$this._data ??= new ListBuilder<CommentDTO>();
  set data(ListBuilder<CommentDTO>? data) => _$this._data = data;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  int? _startIndex;
  int? get startIndex => _$this._startIndex;
  set startIndex(int? startIndex) => _$this._startIndex = startIndex;

  int? _dataCount;
  int? get dataCount => _$this._dataCount;
  set dataCount(int? dataCount) => _$this._dataCount = dataCount;

  CommentDTOListingResponseBuilder() {
    CommentDTOListingResponse._defaults(this);
  }

  CommentDTOListingResponseBuilder get _$this {
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
  void replace(CommentDTOListingResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentDTOListingResponse;
  }

  @override
  void update(void Function(CommentDTOListingResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentDTOListingResponse build() => _build();

  _$CommentDTOListingResponse _build() {
    _$CommentDTOListingResponse _$result;
    try {
      _$result = _$v ??
          new _$CommentDTOListingResponse._(
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
            r'CommentDTOListingResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
