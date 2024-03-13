// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatDTO extends ChatDTO {
  @override
  final String? userId;
  @override
  final String? name;
  @override
  final String? profileImageUrl;

  factory _$ChatDTO([void Function(ChatDTOBuilder)? updates]) =>
      (new ChatDTOBuilder()..update(updates))._build();

  _$ChatDTO._({this.userId, this.name, this.profileImageUrl}) : super._();

  @override
  ChatDTO rebuild(void Function(ChatDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatDTOBuilder toBuilder() => new ChatDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatDTO &&
        userId == other.userId &&
        name == other.name &&
        profileImageUrl == other.profileImageUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, profileImageUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatDTO')
          ..add('userId', userId)
          ..add('name', name)
          ..add('profileImageUrl', profileImageUrl))
        .toString();
  }
}

class ChatDTOBuilder implements Builder<ChatDTO, ChatDTOBuilder> {
  _$ChatDTO? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _profileImageUrl;
  String? get profileImageUrl => _$this._profileImageUrl;
  set profileImageUrl(String? profileImageUrl) =>
      _$this._profileImageUrl = profileImageUrl;

  ChatDTOBuilder() {
    ChatDTO._defaults(this);
  }

  ChatDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _name = $v.name;
      _profileImageUrl = $v.profileImageUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatDTO;
  }

  @override
  void update(void Function(ChatDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatDTO build() => _build();

  _$ChatDTO _build() {
    final _$result = _$v ??
        new _$ChatDTO._(
            userId: userId, name: name, profileImageUrl: profileImageUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
