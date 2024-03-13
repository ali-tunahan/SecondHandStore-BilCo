// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateUserDTO extends UpdateUserDTO {
  @override
  final String? id;
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
  @override
  final String? profileImage;

  factory _$UpdateUserDTO([void Function(UpdateUserDTOBuilder)? updates]) =>
      (new UpdateUserDTOBuilder()..update(updates))._build();

  _$UpdateUserDTO._(
      {this.id,
      this.enabled,
      this.userName,
      this.password,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.profileImage})
      : super._();

  @override
  UpdateUserDTO rebuild(void Function(UpdateUserDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateUserDTOBuilder toBuilder() => new UpdateUserDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateUserDTO &&
        id == other.id &&
        enabled == other.enabled &&
        userName == other.userName &&
        password == other.password &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phoneNumber == other.phoneNumber &&
        profileImage == other.profileImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, profileImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateUserDTO')
          ..add('id', id)
          ..add('enabled', enabled)
          ..add('userName', userName)
          ..add('password', password)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('phoneNumber', phoneNumber)
          ..add('profileImage', profileImage))
        .toString();
  }
}

class UpdateUserDTOBuilder
    implements Builder<UpdateUserDTO, UpdateUserDTOBuilder> {
  _$UpdateUserDTO? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

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

  String? _profileImage;
  String? get profileImage => _$this._profileImage;
  set profileImage(String? profileImage) => _$this._profileImage = profileImage;

  UpdateUserDTOBuilder() {
    UpdateUserDTO._defaults(this);
  }

  UpdateUserDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _enabled = $v.enabled;
      _userName = $v.userName;
      _password = $v.password;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _phoneNumber = $v.phoneNumber;
      _profileImage = $v.profileImage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateUserDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateUserDTO;
  }

  @override
  void update(void Function(UpdateUserDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateUserDTO build() => _build();

  _$UpdateUserDTO _build() {
    final _$result = _$v ??
        new _$UpdateUserDTO._(
            id: id,
            enabled: enabled,
            userName: userName,
            password: password,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            profileImage: profileImage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
