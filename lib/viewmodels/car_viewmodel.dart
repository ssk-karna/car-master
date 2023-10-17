import 'package:connectus_dummy/models/car_response.dart';
import 'package:connectus_dummy/utils/constants.dart';
import 'package:dio/dio.dart';

import '../models/attachment.dart';
import '../models/car_data.dart';

class CarViewModel {
  final Dio _dio = Dio();

  Future<CarResponse> fetchCarData() async {
    try {
      final response = await _dio.post(
        "${Constants.BASE_URL}${Constants.API_PATH}GetAllDetails",
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
      urlsList.add(attachment.attachmentUrl[0].url);
    }
    return urlsList;
  }
}