import 'package:background_listen_sms/model/sms_data.dart';
import 'package:background_listen_sms/utils/extension.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'local_datasources.dart';

class SMSLocalDataSource implements LocalDataSource<SMSData> {
  @override
  Isar? isar;

  @override
  Future<void> openIsarInstance([dynamic arg]) async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([SMSDataSchema], directory: dir.path);
  }

  @override
  Future<void> create({required SMSData data}) async {
    if (!(isar?.isOpen ?? false)) await openIsarInstance();
    if (isar.isNull) return;
    await isar?.writeTxn(
      () async {
        final sMSDatas =
            await isar?.sMSDatas.where().idEqualTo(data.id).findFirst();
        if (sMSDatas.isNotNull) {
          sMSDatas!.status = data.status;
          await isar?.sMSDatas.put(sMSDatas);
        } else {
          await isar?.sMSDatas.put(data);
        }
      },
    );
  }

  @override
  Future<void> putAll({required List<SMSData> listData}) async {
    if (!(isar?.isOpen ?? false)) await openIsarInstance();
    await isar?.writeTxn(() async {
      for (var product in listData) {
        await isar?.sMSDatas.put(product);
      }
    });
  }

  @override
  Future<List<SMSData>> getAll({int? limit, int? offset}) async {
    if (!(isar?.isOpen ?? false)) await openIsarInstance();
    final qrProducts = isar?.sMSDatas.where();
    final sortByCreatedTime = qrProducts;
    final filterByLimitOffset = (sortByCreatedTime ?? qrProducts)
        ?.offset(offset ?? 0)
        .limit(limit ?? 100);
    final result = await filterByLimitOffset?.findAll();
    return result ?? [];
  }

  @override
  Future<SMSData?> getById({required int id}) async {
    if (!(isar?.isOpen ?? false)) await openIsarInstance();
    final productInBag = await isar?.sMSDatas.get(id);
    return productInBag;
  }

  @override
  Future<void> clearBox() async {
    await deleteAll();
    await isar?.close();
  }

  @override
  Future<void> delete({required int id}) async {
    if (!(isar?.isOpen ?? false)) await openIsarInstance();
    await isar?.writeTxn(() async {
      await isar?.sMSDatas.delete(id);
    });
  }

  @override
  Future<void> deleteAll() async {
    if (!(isar?.isOpen ?? false)) await openIsarInstance();
    final all = await getAll();
    await isar?.writeTxn(() async {
      for (var e in all) {
        await isar?.sMSDatas.delete(e.id);
      }
    });
  }

  @override
  Future<void> update({required SMSData data}) async {
    if (!(isar?.isOpen ?? false)) await openIsarInstance();
    if (isar.isNull) return;
    await isar?.writeTxn(
      () async {
        final sMSDatas =
            await isar?.sMSDatas.where().idEqualTo(data.id).findFirst();
        if (sMSDatas.isNotNull) {
          sMSDatas!.status = data.status;
          await isar?.sMSDatas.put(sMSDatas);
        } else {
          await isar?.sMSDatas.put(data);
        }
      },
    );
  }

  @override
  Future<void> dispose() async {
    await isar?.close();
  }
}
