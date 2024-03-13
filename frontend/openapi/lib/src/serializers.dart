//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/authorize_dto.dart';
import 'package:openapi/src/model/authorize_request.dart';
import 'package:openapi/src/model/chat_dto.dart';
import 'package:openapi/src/model/comment.dart';
import 'package:openapi/src/model/comment_dto.dart';
import 'package:openapi/src/model/comment_dto_listing_response.dart';
import 'package:openapi/src/model/create_comment_dto.dart';
import 'package:openapi/src/model/create_demo_dto.dart';
import 'package:openapi/src/model/create_post_dto.dart';
import 'package:openapi/src/model/create_user_dto.dart';
import 'package:openapi/src/model/message.dart';
import 'package:openapi/src/model/post.dart';
import 'package:openapi/src/model/post_dto.dart';
import 'package:openapi/src/model/post_dto_listing_response.dart';
import 'package:openapi/src/model/post_details_dto.dart';
import 'package:openapi/src/model/post_image.dart';
import 'package:openapi/src/model/refresh_request.dart';
import 'package:openapi/src/model/saved_post.dart';
import 'package:openapi/src/model/saved_post_dto.dart';
import 'package:openapi/src/model/update_post_dto.dart';
import 'package:openapi/src/model/update_user_dto.dart';
import 'package:openapi/src/model/user.dart';
import 'package:openapi/src/model/user_dto.dart';
import 'package:openapi/src/model/user_image.dart';
import 'package:openapi/src/model/user_type.dart';

part 'serializers.g.dart';

@SerializersFor([
  AuthorizeDTO,
  AuthorizeRequest,
  ChatDTO,
  Comment,
  CommentDTO,
  CommentDTOListingResponse,
  CreateCommentDTO,
  CreateDemoDTO,
  CreatePostDTO,
  CreateUserDTO,
  Message,
  Post,
  PostDTO,
  PostDTOListingResponse,
  PostDetailsDTO,
  PostImage,
  RefreshRequest,
  SavedPost,
  SavedPostDTO,
  UpdatePostDTO,
  UpdateUserDTO,
  User,
  UserDTO,
  UserImage,
  UserType,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Message)]),
        () => ListBuilder<Message>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SavedPostDTO)]),
        () => ListBuilder<SavedPostDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ChatDTO)]),
        () => ListBuilder<ChatDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(PostDTO)]),
        () => ListBuilder<PostDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CommentDTO)]),
        () => ListBuilder<CommentDTO>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
