import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

typedef DbFunction = Future Function();

abstract class BaseDatabase<T> {
  @protected
  abstract String boxName;

  @protected
  Future<void> openBoxIfNot() async {
    if (boxName.isEmpty) {
      throw Exception("Provide Hive box name");
    }
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<T>(boxName);
    }
  }

  @protected
  addToBox(T item) async {
    await openBoxIfNot();
    await Hive.box<T>(boxName).add(item);
  }

  @protected
  Future<List<T>> getItemsFromBox() async {
    await openBoxIfNot();
    return Hive.box<T>(boxName).values.toList();
  }

  @protected
  clearBox() async {
    await openBoxIfNot();
    await Hive.box(boxName).clear();
  }
}
