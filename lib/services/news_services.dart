import 'package:dio/dio.dart';
import 'package:rf_test/constant/constants.dart';

class NewsServices{
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.baseUrl,
      responseType: ResponseType.json,
    )
  );
  
  fetchNews()async{

    var response = await dio.get('&language=bn');

 return response.data;

  }
  
  
}