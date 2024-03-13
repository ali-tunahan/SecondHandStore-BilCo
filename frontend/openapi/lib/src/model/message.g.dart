// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Message extends Message {
  @override
  final String? id;
  @override
  final String? senderUserId;
  @override
  final String? receiverUserId;
  @override
  final String? text;
  @override
  final DateTime? sentTime;

  factory _$Message([void Function(MessageBuilder)? updates]) =>
      (new MessageBuilder()..update(updates))._build();

  _$Message._(
      {this.id,
      this.senderUserId,
      this.receiverUserId,
      this.text,
      this.sentTime})
      : super._();

  @override
  Message rebuild(void Function(MessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageBuilder toBuilder() => new MessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Message &&
        id == other.id &&
        senderUserId == other.senderUserId &&
        receiverUserId == other.receiverUserId &&
        text == other.text &&
        sentTime == other.sentTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, senderUserId.hashCode);
    _$hash = $jc(_$hash, receiverUserId.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, sentTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Message')
          ..add('id', id)
          ..add('senderUserId', senderUserId)
          ..add('receiverUserId', receiverUserId)
          ..add('text', text)
          ..add('sentTime', sentTime))
        .toString();
  }
}

class MessageBuilder implements Builder<Message, MessageBuilder> {
  _$Message? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _senderUserId;
  String? get senderUserId => _$this._senderUserId;
  set senderUserId(String? senderUserId) => _$this._senderUserId = senderUserId;

  String? _receiverUserId;
  String? get receiverUserId => _$this._receiverUserId;
  set receiverUserId(String? receiverUserId) =>
      _$this._receiverUserId = receiverUserId;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  DateTime? _sentTime;
  DateTime? get sentTime => _$this._sentTime;
  set sentTime(DateTime? sentTime) => _$this._sentTime = sentTime;

  MessageBuilder() {
    Message._defaults(this);
  }

  MessageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _senderUserId = $v.senderUserId;
      _receiverUserId = $v.receiverUserId;
      _text = $v.text;
      _sentTime = $v.sentTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Message other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Message;
  }

  @override
  void update(void Function(MessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Message build() => _build();

  _$Message _build() {
    final _$result = _$v ??
        new _$Message._(
            id: id,
            senderUserId: senderUserId,
            receiverUserId: receiverUserId,
            text: text,
            sentTime: sentTime);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
