import 'package:isar/isar.dart';

export 'sms_local_datasource.dart';

abstract class LocalDataSource<T> {
  Isar? isar;
  Future<void> openIsarInstance([dynamic arg]);
  Future<List<T>> getAll({int? limit, int? offset});
  Future<T?> getById({required int id});
  Future<void> create({required T data});
  Future<void> putAll({required List<T> listData});
  Future<void> update({required T data});
  Future<void> delete({required int id});
  Future<void> deleteAll();
  Future<void> clearBox();
  Future<void> dispose();
}
