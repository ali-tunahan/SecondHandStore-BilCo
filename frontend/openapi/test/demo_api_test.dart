import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DemoApi
void main() {
  final instance = Openapi().getDemoApi();

  group(DemoApi, () {
    //Future demosFuzzyGet({ String searchTerm, int startIndex, int count, double minimumSimilarity }) async
    test('test demosFuzzyGet', () async {
      // TODO
    });

    //Future demosGet() async
    test('test demosGet', () async {
      // TODO
    });

    //Future demosIdDelete(String id) async
    test('test demosIdDelete', () async {
      // TODO
    });

    //Future demosIdGet(String id) async
    test('test demosIdGet', () async {
      // TODO
    });

    //Future demosIdPut(String id, { CreateDemoDTO createDemoDTO }) async
    test('test demosIdPut', () async {
      // TODO
    });

    //Future demosPost({ CreateDemoDTO createDemoDTO }) async
    test('test demosPost', () async {
      // TODO
    });

  });
}
