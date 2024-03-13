import 'dart:convert';
import 'package:bil_co/ApiSingleton.dart';
import 'package:http/http.dart';
import 'package:openapi/openapi.dart';

Future<List<PostDTO>> fetchData(int currentPage, int pageSize, int postType, String? title, String? tags,String? max, String? min, int? lostItemState ) async {
  int? minint;
  int? maxint;
  if(title=="") title = null;
  if(tags=="") tags = null;
  if(min=="-1"||min==null) minint = null;
  if(max=="-1"||max==null) maxint = null;

  var result = (await await AuthorizedAPISingleton.instance.getPostApi().postsFuzzyGet(startIndex: (currentPage-1)*pageSize,count: pageSize,postType: postType,searchTitle: title, tags:tags , minPrice: int.tryParse(min??""),maxPrice:  int.tryParse(max??""),lostItemState: lostItemState)).data;

  var count = result?.dataCount;
  var data = result!.data?.asList();
  if(data!=null)
    return data;
  else
    throw Exception('Failed to fetch data');
  }
