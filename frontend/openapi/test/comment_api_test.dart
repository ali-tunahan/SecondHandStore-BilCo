import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CommentApi
void main() {
  final instance = Openapi().getCommentApi();

  group(CommentApi, () {
    //Future<CommentDTOListingResponse> commentsFuzzyGet({ String commentedToUserId, int startIndex, int count }) async
    test('test commentsFuzzyGet', () async {
      // TODO
    });

    //Future<BuiltList<CommentDTO>> commentsGet() async
    test('test commentsGet', () async {
      // TODO
    });

    //Future commentsIdDelete(String id) async
    test('test commentsIdDelete', () async {
      // TODO
    });

    //Future<CommentDTO> commentsIdGet(String id) async
    test('test commentsIdGet', () async {
      // TODO
    });

    //Future commentsIdPut(String id, { CreateCommentDTO createCommentDTO }) async
    test('test commentsIdPut', () async {
      // TODO
    });

    //Future<Comment> commentsPost({ CreateCommentDTO createCommentDTO }) async
    test('test commentsPost', () async {
      // TODO
    });

  });
}
