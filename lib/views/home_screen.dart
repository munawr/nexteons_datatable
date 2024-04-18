import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/table_controller.dart';

class HomeScreen extends StatelessWidget {
  final TableController controller = Get.put(TableController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        /// /// /// Data table to view: _name, _uid, _docType, _url /// /// ///
        child: Obx(
              () => DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 200,
            columns: const [
              DataColumn2(
                label: Text('Name'),
                size: ColumnSize.S,
              ),
              DataColumn2(
                size: ColumnSize.S,
                label: Text('UID'),
              ),
              DataColumn2(
                size: ColumnSize.S,
                label: Text('Doc type'),
              ),
              DataColumn2(
                size: ColumnSize.S,
                label: Text('Image'),
              ),
            ],
            rows: controller.tableRows.toList(),
          ),
        ),
      ),
    );
  }
}
