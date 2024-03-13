import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PostApi
void main() {
  final instance = Openapi().getPostApi();

  group(PostApi, () {
    //Future<PostDTOListingResponse> postsFuzzyGet({ String userId, int startIndex, int count, String tags, int minPrice, int maxPrice, String searchTitle, PostType postType }) async
    test('test postsFuzzyGet', () async {
      // TODO
    });

    //Future<BuiltList<PostDTO>> postsGet() async
    test('test postsGet', () async {
      // TODO
    });

    //Future postsIdDelete(String id) async
    test('test postsIdDelete', () async {
      // TODO
    });

    //Future<PostDetailsDTO> postsIdGet(String id) async
    test('test postsIdGet', () async {
      // TODO
    });

    //Future postsIdPut(String id, { PostDTO postDTO }) async
    test('test postsIdPut', () async {
      // TODO
    });

    //Future<Post> postsPost({ CreatePostDTO createPostDTO }) async
    test('test postsPost', () async {
      // TODO
    });

  });
}
