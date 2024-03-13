// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorize_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthorizeRequest extends AuthorizeRequest {
  @override
  final String? userName;
  @override
  final String? password;

  factory _$AuthorizeRequest(
          [void Function(AuthorizeRequestBuilder)? updates]) =>
      (new AuthorizeRequestBuilder()..update(updates))._build();

  _$AuthorizeRequest._({this.userName, this.password}) : super._();

  @override
  AuthorizeRequest rebuild(void Function(AuthorizeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthorizeRequestBuilder toBuilder() =>
      new AuthorizeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthorizeRequest &&
        userName == other.userName &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthorizeRequest')
          ..add('userName', userName)
          ..add('password', password))
        .toString();
  }
}

class AuthorizeRequestBuilder
    implements Builder<AuthorizeRequest, AuthorizeRequestBuilder> {
  _$AuthorizeRequest? _$v;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  AuthorizeRequestBuilder() {
    AuthorizeRequest._defaults(this);
  }

  AuthorizeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userName = $v.userName;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthorizeRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthorizeRequest;
  }

  @override
  void update(void Function(AuthorizeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthorizeRequest build() => _build();

  _$AuthorizeRequest _build() {
    final _$result =
        _$v ?? new _$AuthorizeRequest._(userName: userName, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
