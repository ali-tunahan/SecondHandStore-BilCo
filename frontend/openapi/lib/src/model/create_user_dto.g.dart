// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateUserDTO extends CreateUserDTO {
  @override
  final bool? enabled;
  @override
  final String? userName;
  @override
  final String? password;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? phoneNumber;

  factory _$CreateUserDTO([void Function(CreateUserDTOBuilder)? updates]) =>
      (new CreateUserDTOBuilder()..update(updates))._build();

  _$CreateUserDTO._(
      {this.enabled,
      this.userName,
      this.password,
      this.firstName,
      this.lastName,
      this.phoneNumber})
      : super._();

  @override
  CreateUserDTO rebuild(void Function(CreateUserDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateUserDTOBuilder toBuilder() => new CreateUserDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateUserDTO &&
        enabled == other.enabled &&
        userName == other.userName &&
        password == other.password &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateUserDTO')
          ..add('enabled', enabled)
          ..add('userName', userName)
          ..add('password', password)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('phoneNumber', phoneNumber))
        .toString();
  }
}

class CreateUserDTOBuilder
    implements Builder<CreateUserDTO, CreateUserDTOBuilder> {
  _$CreateUserDTO? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  CreateUserDTOBuilder() {
    CreateUserDTO._defaults(this);
  }

  CreateUserDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _userName = $v.userName;
      _password = $v.password;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _phoneNumber = $v.phoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateUserDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateUserDTO;
  }

  @override
  void update(void Function(CreateUserDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateUserDTO build() => _build();

  _$CreateUserDTO _build() {
    final _$result = _$v ??
        new _$CreateUserDTO._(
            enabled: enabled,
            userName: userName,
            password: password,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
