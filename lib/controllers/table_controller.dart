import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../models/table_model.dart';

class TableController extends GetxController {
  final RxList<DataRow> tableRows = <DataRow>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
/// /// /// Dio POST request /// /// ///
  Future<void> fetchData() async {
    try {
      final dio = Dio(BaseOptions(baseUrl: 'https://ajcjewel.com:4000'));

      final data = {
        "statusArray": [1],
        "screenType": [],
        "responseFormat": [],
        "globalGalleryIds": [],
        "categoryIds": [],
        "docTypes": [0],
        "types": [],
        "limit": 10,
        "skip": 0,
        "searchingText": ""
      };

      final headers = {
        'Authorization':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcxMTQ0NTY1OSwiZXhwIjoxNzQyOTgxNjU5fQ.lE1Gbdm8YZ6Fany4184Pb7kSUg-z6Rk8Ag1irB3fstc',
        'Content-Type': 'application/json',
      };
      final response = await dio.post('/api/global-gallery/list',
          data: data, options: Options(headers: headers));
      final apiResponse = ApiResponse.fromJson(response.data);
      final List<DataRow> rows = apiResponse.data.list
          .map<DataRow>((imageItem) => DataRow(cells: [
        DataCell(Text(imageItem.name, style: (TextStyle(overflow: TextOverflow.ellipsis,)),)),
        DataCell(Text(imageItem.uid.toString())),
        DataCell(Text(imageItem.docType.toString())),
        DataCell(Image.network(imageItem.url)),
      ]))
          .toList();

      tableRows.assignAll(rows);
    } catch (e) {
      //print(e);
    }
  }
}
