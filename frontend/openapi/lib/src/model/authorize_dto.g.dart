// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorize_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthorizeDTO extends AuthorizeDTO {
  @override
  final String? userId;
  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final DateTime? refreshTokenExpires;
  @override
  final bool? isAuthorized;

  factory _$AuthorizeDTO([void Function(AuthorizeDTOBuilder)? updates]) =>
      (new AuthorizeDTOBuilder()..update(updates))._build();

  _$AuthorizeDTO._(
      {this.userId,
      this.accessToken,
      this.refreshToken,
      this.refreshTokenExpires,
      this.isAuthorized})
      : super._();

  @override
  AuthorizeDTO rebuild(void Function(AuthorizeDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthorizeDTOBuilder toBuilder() => new AuthorizeDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthorizeDTO &&
        userId == other.userId &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        refreshTokenExpires == other.refreshTokenExpires &&
        isAuthorized == other.isAuthorized;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, refreshTokenExpires.hashCode);
    _$hash = $jc(_$hash, isAuthorized.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthorizeDTO')
          ..add('userId', userId)
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('refreshTokenExpires', refreshTokenExpires)
          ..add('isAuthorized', isAuthorized))
        .toString();
  }
}

class AuthorizeDTOBuilder
    implements Builder<AuthorizeDTO, AuthorizeDTOBuilder> {
  _$AuthorizeDTO? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  DateTime? _refreshTokenExpires;
  DateTime? get refreshTokenExpires => _$this._refreshTokenExpires;
  set refreshTokenExpires(DateTime? refreshTokenExpires) =>
      _$this._refreshTokenExpires = refreshTokenExpires;

  bool? _isAuthorized;
  bool? get isAuthorized => _$this._isAuthorized;
  set isAuthorized(bool? isAuthorized) => _$this._isAuthorized = isAuthorized;

  AuthorizeDTOBuilder() {
    AuthorizeDTO._defaults(this);
  }

  AuthorizeDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _refreshTokenExpires = $v.refreshTokenExpires;
      _isAuthorized = $v.isAuthorized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthorizeDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthorizeDTO;
  }

  @override
  void update(void Function(AuthorizeDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthorizeDTO build() => _build();

  _$AuthorizeDTO _build() {
    final _$result = _$v ??
        new _$AuthorizeDTO._(
            userId: userId,
            accessToken: accessToken,
            refreshToken: refreshToken,
            refreshTokenExpires: refreshTokenExpires,
            isAuthorized: isAuthorized);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
