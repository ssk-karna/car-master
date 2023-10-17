import 'package:connectus_dummy/models/car_response.dart';
import 'package:connectus_dummy/utils/constants.dart';
import 'package:dio/dio.dart';
import '../models/attachment.dart';
import '../models/car_data.dart';

class CarViewModel {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Constants.BASE_URL,
    connectTimeout: Duration(seconds: 15), // 5 seconds
    receiveTimeout: Duration(seconds: 15),
  ));

  Future<CarResponse> fetchCarData() async {
    try {
      final response = await _dio.post(
        "${Constants.API_PATH}${Constants.endPointGetAllDetails}",
        data: {'type': 'CAR'},
      );

      if (response.statusCode == 200) {
        return CarResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load car data');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  List<String> getImageUrls(CarData data){
    List<String> urlsList = [];

    for(Attachment attachment in data.attachments){
      if(attachment.attachmentUrl[0].url.isNotEmpty)
        urlsList.add(attachment.attachmentUrl[0].url);
      else
        urlsList.add(Constants.NOTFOUNDURL);
    }
    return urlsList;
  }
}