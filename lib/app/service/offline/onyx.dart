import 'dart:developer';

import 'package:onyx_test/app/modules/home/models/delivery_bill_model.dart';
import 'package:sqflite/sqflite.dart';

import 'databse/database_services.dart';

class OnyxOfflineService extends BaseTableService<DeliveryBills> {
  OnyxOfflineService(Database db) : super(db, DeliveryBills.databaseName);

  Future<void> addOnyxDelivery({
    required DeliveryBills bills,
  }) async {
    await db.insert(
      name,
      bills.toJson(),
    );

    log('Added New $name');
  }

  @override
  Future<List<DeliveryBills>> findManyFromDb([String keyword = '']) async {
    final res = await db.query(name);
    return res.map((e) => DeliveryBills.fromSql(e)).toList();
  }

  Future<List<DeliveryBills>> findNewOrders() async {
    final res = await db.query(
      name,
      where: 'dlvryStatusFlg = ?',
      whereArgs: ['0'],
    );
    return res
        .map(
          (e) => DeliveryBills.fromSql(e),
        )
        .toList();
  }
}
