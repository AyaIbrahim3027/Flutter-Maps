import 'package:dio/dio.dart';
import 'package:flutter_maps/constants/strings.dart';

class Places {
  late Dio dio;
  Places() {
    BaseOptions options =BaseOptions(
      connectTimeout: const Duration(seconds: 20 * 1000),
      receiveTimeout: const Duration(seconds: 20 * 1000),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> fetchSuggestions(String place , String sessionToken) async {
    try{
      Response response = await dio.get(suggestionsBaseUrl, queryParameters: {
        'input': place,
        'types': 'address',
        'components': 'country:eg',
        'key': googleAPIKey,
        'sessiontoken': sessionToken,
      });
      return response.data['predictions'];
    }catch(error){
      print(error.toString());
      return[];
    }
  }

  Future<dynamic> getPlaceLocation(String placeId , String sessionToken) async {
    try{
      Response response = await dio.get(placeLocationBaseUrl, queryParameters: {
        'place_id': placeId,
        'fields': 'geometry',
        'key': googleAPIKey,
        'sessiontoken': sessionToken,
      });
      return response.data;
    }catch(error){
      return Future.error('Place location error : ',StackTrace.fromString('this is its trace'));
    }
  }

}
