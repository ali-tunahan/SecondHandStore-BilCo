// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RefreshRequest extends RefreshRequest {
  @override
  final String? userId;
  @override
  final String? refreshToken;

  factory _$RefreshRequest([void Function(RefreshRequestBuilder)? updates]) =>
      (new RefreshRequestBuilder()..update(updates))._build();

  _$RefreshRequest._({this.userId, this.refreshToken}) : super._();

  @override
  RefreshRequest rebuild(void Function(RefreshRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshRequestBuilder toBuilder() =>
      new RefreshRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshRequest &&
        userId == other.userId &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RefreshRequest')
          ..add('userId', userId)
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class RefreshRequestBuilder
    implements Builder<RefreshRequest, RefreshRequestBuilder> {
  _$RefreshRequest? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  RefreshRequestBuilder() {
    RefreshRequest._defaults(this);
  }

  RefreshRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefreshRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RefreshRequest;
  }

  @override
  void update(void Function(RefreshRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefreshRequest build() => _build();

  _$RefreshRequest _build() {
    final _$result = _$v ??
        new _$RefreshRequest._(userId: userId, refreshToken: refreshToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
