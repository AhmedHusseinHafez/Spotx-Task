import 'dart:convert';
import 'package:spotx/core/constants/app_constants.dart';
import 'package:spotx/data/models/region/region.dart';
import 'package:http/http.dart' as http;
import 'package:spotx/data/models/region_by_id/region_by_id.dart';
import 'package:spotx/data/models/ui_builder/ui_builder_model.dart';
import 'package:spotx/data/models/units/units.dart';

class ApiClient {
  Future<List<dynamic>> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$BASE_URL$endpoint'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      if (data is List) {
        return data;
      } else if (data is Map<String, dynamic>) {
        final dataList = data['sub_regions'];
        return dataList;
      } else {
        throw Exception('Failed to load data');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class RemoteApi {
  final apiClient = ApiClient();
  Future<List<UiBuilderModel>> getUiBuilders() async {
    final uiBuilderData = await apiClient.fetchData("/ui-builders");
    final List<UiBuilderModel> uiBuilder = uiBuilderData
        .map<UiBuilderModel>(
            (jsonUiBuilderModel) => UiBuilderModel.fromJson(jsonUiBuilderModel))
        .toList();
    return uiBuilder;
  }

  Future fetchRegionData() async {
    final regionsData = await apiClient.fetchData("/regions");
    final List<RegionModel> regions =
        regionsData.map((item) => RegionModel.fromJson(item)).toList();
    return regions;
  }

  Future fetchUnitsData() async {
    final unitsData = await apiClient.fetchData("/user/units?page=1");
    final List<UnitsModel> units =
        unitsData.map((item) => UnitsModel.fromJson(item)).toList();
    return units;
  }

  Future fetchUnitsCapacityData(int guest) async {
    final unitsData =
        await apiClient.fetchData("/user/units?page=1&guest=$guest");
    final List<UnitsModel> units =
        unitsData.map((item) => UnitsModel.fromJson(item)).toList();
    return units;
  }

  Future fetchRegionDetailsData({required int regionId}) async {
    final regionsDetailsData = await apiClient.fetchData("/regions/$regionId");
    final List<RegionByIDModel> regionsDetails = regionsDetailsData
        .map((item) => RegionByIDModel.fromJson(item))
        .toList();
    return regionsDetails;
  }
}
