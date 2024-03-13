// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$User extends User {
  @override
  final String? id;
  @override
  final String? userName;
  @override
  final String? normalizedUserName;
  @override
  final String? email;
  @override
  final String? normalizedEmail;
  @override
  final bool? emailConfirmed;
  @override
  final String? passwordHash;
  @override
  final String? securityStamp;
  @override
  final String? concurrencyStamp;
  @override
  final String? phoneNumber;
  @override
  final bool? phoneNumberConfirmed;
  @override
  final bool? twoFactorEnabled;
  @override
  final DateTime? lockoutEnd;
  @override
  final bool? lockoutEnabled;
  @override
  final int? accessFailedCount;
  @override
  final bool? enabled;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final UserType? userType;
  @override
  final UserImage? userImage;
  @override
  final BuiltList<Post>? posts;
  @override
  final BuiltList<SavedPost>? savedPosts;
  @override
  final BuiltList<Comment>? commentsMade;
  @override
  final BuiltList<Comment>? commentsReceived;
  @override
  final String? refreshToken;
  @override
  final DateTime? refreshTokenExpires;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates))._build();

  _$User._(
      {this.id,
      this.userName,
      this.normalizedUserName,
      this.email,
      this.normalizedEmail,
      this.emailConfirmed,
      this.passwordHash,
      this.securityStamp,
      this.concurrencyStamp,
      this.phoneNumber,
      this.phoneNumberConfirmed,
      this.twoFactorEnabled,
      this.lockoutEnd,
      this.lockoutEnabled,
      this.accessFailedCount,
      this.enabled,
      this.firstName,
      this.lastName,
      this.userType,
      this.userImage,
      this.posts,
      this.savedPosts,
      this.commentsMade,
      this.commentsReceived,
      this.refreshToken,
      this.refreshTokenExpires})
      : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        userName == other.userName &&
        normalizedUserName == other.normalizedUserName &&
        email == other.email &&
        normalizedEmail == other.normalizedEmail &&
        emailConfirmed == other.emailConfirmed &&
        passwordHash == other.passwordHash &&
        securityStamp == other.securityStamp &&
        concurrencyStamp == other.concurrencyStamp &&
        phoneNumber == other.phoneNumber &&
        phoneNumberConfirmed == other.phoneNumberConfirmed &&
        twoFactorEnabled == other.twoFactorEnabled &&
        lockoutEnd == other.lockoutEnd &&
        lockoutEnabled == other.lockoutEnabled &&
        accessFailedCount == other.accessFailedCount &&
        enabled == other.enabled &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        userType == other.userType &&
        userImage == other.userImage &&
        posts == other.posts &&
        savedPosts == other.savedPosts &&
        commentsMade == other.commentsMade &&
        commentsReceived == other.commentsReceived &&
        refreshToken == other.refreshToken &&
        refreshTokenExpires == other.refreshTokenExpires;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, normalizedUserName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, normalizedEmail.hashCode);
    _$hash = $jc(_$hash, emailConfirmed.hashCode);
    _$hash = $jc(_$hash, passwordHash.hashCode);
    _$hash = $jc(_$hash, securityStamp.hashCode);
    _$hash = $jc(_$hash, concurrencyStamp.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, phoneNumberConfirmed.hashCode);
    _$hash = $jc(_$hash, twoFactorEnabled.hashCode);
    _$hash = $jc(_$hash, lockoutEnd.hashCode);
    _$hash = $jc(_$hash, lockoutEnabled.hashCode);
    _$hash = $jc(_$hash, accessFailedCount.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, userType.hashCode);
    _$hash = $jc(_$hash, userImage.hashCode);
    _$hash = $jc(_$hash, posts.hashCode);
    _$hash = $jc(_$hash, savedPosts.hashCode);
    _$hash = $jc(_$hash, commentsMade.hashCode);
    _$hash = $jc(_$hash, commentsReceived.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, refreshTokenExpires.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'User')
          ..add('id', id)
          ..add('userName', userName)
          ..add('normalizedUserName', normalizedUserName)
          ..add('email', email)
          ..add('normalizedEmail', normalizedEmail)
          ..add('emailConfirmed', emailConfirmed)
          ..add('passwordHash', passwordHash)
          ..add('securityStamp', securityStamp)
          ..add('concurrencyStamp', concurrencyStamp)
          ..add('phoneNumber', phoneNumber)
          ..add('phoneNumberConfirmed', phoneNumberConfirmed)
          ..add('twoFactorEnabled', twoFactorEnabled)
          ..add('lockoutEnd', lockoutEnd)
          ..add('lockoutEnabled', lockoutEnabled)
          ..add('accessFailedCount', accessFailedCount)
          ..add('enabled', enabled)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('userType', userType)
          ..add('userImage', userImage)
          ..add('posts', posts)
          ..add('savedPosts', savedPosts)
          ..add('commentsMade', commentsMade)
          ..add('commentsReceived', commentsReceived)
          ..add('refreshToken', refreshToken)
          ..add('refreshTokenExpires', refreshTokenExpires))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _normalizedUserName;
  String? get normalizedUserName => _$this._normalizedUserName;
  set normalizedUserName(String? normalizedUserName) =>
      _$this._normalizedUserName = normalizedUserName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _normalizedEmail;
  String? get normalizedEmail => _$this._normalizedEmail;
  set normalizedEmail(String? normalizedEmail) =>
      _$this._normalizedEmail = normalizedEmail;

  bool? _emailConfirmed;
  bool? get emailConfirmed => _$this._emailConfirmed;
  set emailConfirmed(bool? emailConfirmed) =>
      _$this._emailConfirmed = emailConfirmed;

  String? _passwordHash;
  String? get passwordHash => _$this._passwordHash;
  set passwordHash(String? passwordHash) => _$this._passwordHash = passwordHash;

  String? _securityStamp;
  String? get securityStamp => _$this._securityStamp;
  set securityStamp(String? securityStamp) =>
      _$this._securityStamp = securityStamp;

  String? _concurrencyStamp;
  String? get concurrencyStamp => _$this._concurrencyStamp;
  set concurrencyStamp(String? concurrencyStamp) =>
      _$this._concurrencyStamp = concurrencyStamp;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  bool? _phoneNumberConfirmed;
  bool? get phoneNumberConfirmed => _$this._phoneNumberConfirmed;
  set phoneNumberConfirmed(bool? phoneNumberConfirmed) =>
      _$this._phoneNumberConfirmed = phoneNumberConfirmed;

  bool? _twoFactorEnabled;
  bool? get twoFactorEnabled => _$this._twoFactorEnabled;
  set twoFactorEnabled(bool? twoFactorEnabled) =>
      _$this._twoFactorEnabled = twoFactorEnabled;

  DateTime? _lockoutEnd;
  DateTime? get lockoutEnd => _$this._lockoutEnd;
  set lockoutEnd(DateTime? lockoutEnd) => _$this._lockoutEnd = lockoutEnd;

  bool? _lockoutEnabled;
  bool? get lockoutEnabled => _$this._lockoutEnabled;
  set lockoutEnabled(bool? lockoutEnabled) =>
      _$this._lockoutEnabled = lockoutEnabled;

  int? _accessFailedCount;
  int? get accessFailedCount => _$this._accessFailedCount;
  set accessFailedCount(int? accessFailedCount) =>
      _$this._accessFailedCount = accessFailedCount;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  UserType? _userType;
  UserType? get userType => _$this._userType;
  set userType(UserType? userType) => _$this._userType = userType;

  UserImageBuilder? _userImage;
  UserImageBuilder get userImage =>
      _$this._userImage ??= new UserImageBuilder();
  set userImage(UserImageBuilder? userImage) => _$this._userImage = userImage;

  ListBuilder<Post>? _posts;
  ListBuilder<Post> get posts => _$this._posts ??= new ListBuilder<Post>();
  set posts(ListBuilder<Post>? posts) => _$this._posts = posts;

  ListBuilder<SavedPost>? _savedPosts;
  ListBuilder<SavedPost> get savedPosts =>
      _$this._savedPosts ??= new ListBuilder<SavedPost>();
  set savedPosts(ListBuilder<SavedPost>? savedPosts) =>
      _$this._savedPosts = savedPosts;

  ListBuilder<Comment>? _commentsMade;
  ListBuilder<Comment> get commentsMade =>
      _$this._commentsMade ??= new ListBuilder<Comment>();
  set commentsMade(ListBuilder<Comment>? commentsMade) =>
      _$this._commentsMade = commentsMade;

  ListBuilder<Comment>? _commentsReceived;
  ListBuilder<Comment> get commentsReceived =>
      _$this._commentsReceived ??= new ListBuilder<Comment>();
  set commentsReceived(ListBuilder<Comment>? commentsReceived) =>
      _$this._commentsReceived = commentsReceived;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  DateTime? _refreshTokenExpires;
  DateTime? get refreshTokenExpires => _$this._refreshTokenExpires;
  set refreshTokenExpires(DateTime? refreshTokenExpires) =>
      _$this._refreshTokenExpires = refreshTokenExpires;

  UserBuilder() {
    User._defaults(this);
  }

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userName = $v.userName;
      _normalizedUserName = $v.normalizedUserName;
      _email = $v.email;
      _normalizedEmail = $v.normalizedEmail;
      _emailConfirmed = $v.emailConfirmed;
      _passwordHash = $v.passwordHash;
      _securityStamp = $v.securityStamp;
      _concurrencyStamp = $v.concurrencyStamp;
      _phoneNumber = $v.phoneNumber;
      _phoneNumberConfirmed = $v.phoneNumberConfirmed;
      _twoFactorEnabled = $v.twoFactorEnabled;
      _lockoutEnd = $v.lockoutEnd;
      _lockoutEnabled = $v.lockoutEnabled;
      _accessFailedCount = $v.accessFailedCount;
      _enabled = $v.enabled;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _userType = $v.userType;
      _userImage = $v.userImage?.toBuilder();
      _posts = $v.posts?.toBuilder();
      _savedPosts = $v.savedPosts?.toBuilder();
      _commentsMade = $v.commentsMade?.toBuilder();
      _commentsReceived = $v.commentsReceived?.toBuilder();
      _refreshToken = $v.refreshToken;
      _refreshTokenExpires = $v.refreshTokenExpires;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  User build() => _build();

  _$User _build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              id: id,
              userName: userName,
              normalizedUserName: normalizedUserName,
              email: email,
              normalizedEmail: normalizedEmail,
              emailConfirmed: emailConfirmed,
              passwordHash: passwordHash,
              securityStamp: securityStamp,
              concurrencyStamp: concurrencyStamp,
              phoneNumber: phoneNumber,
              phoneNumberConfirmed: phoneNumberConfirmed,
              twoFactorEnabled: twoFactorEnabled,
              lockoutEnd: lockoutEnd,
              lockoutEnabled: lockoutEnabled,
              accessFailedCount: accessFailedCount,
              enabled: enabled,
              firstName: firstName,
              lastName: lastName,
              userType: userType,
              userImage: _userImage?.build(),
              posts: _posts?.build(),
              savedPosts: _savedPosts?.build(),
              commentsMade: _commentsMade?.build(),
              commentsReceived: _commentsReceived?.build(),
              refreshToken: refreshToken,
              refreshTokenExpires: refreshTokenExpires);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userImage';
        _userImage?.build();
        _$failedField = 'posts';
        _posts?.build();
        _$failedField = 'savedPosts';
        _savedPosts?.build();
        _$failedField = 'commentsMade';
        _commentsMade?.build();
        _$failedField = 'commentsReceived';
        _commentsReceived?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
