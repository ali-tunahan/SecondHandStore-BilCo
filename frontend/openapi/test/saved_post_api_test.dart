import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SavedPostApi
void main() {
  final instance = Openapi().getSavedPostApi();

  group(SavedPostApi, () {
    //Future<BuiltList<SavedPostDTO>> savedpostsGet({ String userId }) async
    test('test savedpostsGet', () async {
      // TODO
    });

    //Future savedpostsIdDelete(String id) async
    test('test savedpostsIdDelete', () async {
      // TODO
    });

    //Future<SavedPost> savedpostsPost({ String userId, String postId }) async
    test('test savedpostsPost', () async {
      // TODO
    });

  });
}
