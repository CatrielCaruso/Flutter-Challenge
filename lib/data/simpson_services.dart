import 'package:flutter_challenge/data/base_services.dart';

import 'package:flutter_challenge/domain/model/simpson_model.dart';

class SimpsonServices extends BaseServices {
  Future<List<SimpsonModel>> getSimponsList() async {
    try {
      final response = await dio.get('$apiUrl?count=50');

      final simpsonList = List<SimpsonModel>.from(
          response.data.map((x) => SimpsonModel.fromJson(x)));

      return simpsonList;
    } catch (e) {
      rethrow;
    }
  }
}
