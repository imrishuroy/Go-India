import 'package:dio/dio.dart';
import 'package:go_india/config/endpoints.dart';
import 'package:go_india/models/deal.dart';
import 'package:go_india/respositories/deal/base_deal_repo.dart';

class DealRepository extends BaseDealRepository {
  final Dio _dio;

  DealRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<Deal?>> getBulkDeals() async {
    try {
      final response = await _dio.get(EndPoints.bulkDeal);
      if (response.statusCode == 200) {
        final List data = response.data['Data'] ?? [];

        return data.map((element) => Deal.fromMap(element)).toList();
      }

      return [];
    } catch (error) {
      print('Error getting deals ${error.toString()}');
      rethrow;
    }
  }

  Future<List<Deal?>> getBlockDeals() async {
    try {
      final response = await _dio.get(EndPoints.blockDeal);
      if (response.statusCode == 200) {
        final List data = response.data['Data'] ?? [];

        return data.map((element) => Deal.fromMap(element)).toList();
      }

      return [];
    } catch (error) {
      print('Error getting deals ${error.toString()}');
      rethrow;
    }
  }

  Future<List<Deal?>> getDeals({required String endPoint}) async {
    try {
      // List<Deal?> deals = [];

      final response = await _dio.get(endPoint);
      if (response.statusCode == 200) {
        final List data = response.data['Data'] ?? [];

        return data.map((element) => Deal.fromMap(element)).toList();
      }
      //   for (var element in data) {
      //     deals.add(Deal.fromMap(element));
      //   }
      // }

      // return deals;
      return [];
    } catch (error) {
      print('Error getting deals ${error.toString()}');
      rethrow;
    }
  }
}
