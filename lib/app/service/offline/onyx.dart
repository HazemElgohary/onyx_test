import 'dart:developer';

import 'package:onyx_test/app/modules/home/models/delivery_bill_model.dart';
import 'package:sqflite/sqflite.dart';

import 'databse/database_services.dart';

class OnyxOfflineService extends BaseTableService<DeliveryBillsModel> {
  OnyxOfflineService(Database db) : super(db, DeliveryBillsModel.databaseName);

  Future<void> addOnyxDelivery({
    required DeliveryBillsModel bills,
  }) async {
    await db.insert(
      name,
      bills.toMap(),
    );

    log('Added New $name');
  }

  @override
  Future<List<DeliveryBillsModel>> findManyFromDb([String keyword = '']) async {
    final res = await db.query(name);
    return res.map((e) => DeliveryBillsModel.fromJson(e)).toList();
  }

  Future<List<DeliveryBillsModel>> findNewOrders() async {
    final res = await db.query(
      name,
      where: 'dlvryStatusFlg = ?',
      whereArgs: ['0'],
    );
    return res
        .map(
          (e) => DeliveryBillsModel.fromJson(e),
        )
        .toList();
  }
}
