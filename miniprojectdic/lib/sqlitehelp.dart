import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteHelper {
  String dbFile = 'lexitron.sqlite';
  Database _db;
  //coppy db to app
  void opendb() async {
    //find db folder
    String dbpath = await getDatabasesPath();
    String fullpath = join(dbpath, dbFile);
    //dbexit?
    bool exit = await databaseExists(fullpath);
    if (!exit) {
//no Db
//coppy
//check db
      try {
        Directory(dirname(fullpath)).create(recursive: true);
      } catch (_) {
        print('cannot find  folder');
      }

      //coppy from asset
      print('coppying......');
      ByteData data = await rootBundle.load(join("asset/db", dbFile));
      List bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(fullpath).writeAsBytes(bytes, flush: true);
      print('finish');
    } else {
      print('file exit');
    }
    //open db
    _db = await openDatabase(fullpath, readOnly: true, singleInstance: true);
  }

  //close db
  void closedb() async {
    await _db.close();
    print('dbclose');
  }

  searchdb() async {
     List list = await _db.rawQuery('SELECT * FROM eng2th');
    // if (list.length > 0) {
    //   print(list);
    // } else {
    //   print('Not found');
    // }

    // var list = await _db.query('eng2th',
    //     columns: ['tentry'], where: '"esearch" =?', whereArgs: ['$word']);
    if (list.length > 0) {
    } else {
      print('Not found');
    }
    return list;
  }
  finddb(word) async {
     List list = await _db.rawQuery('SELECT * FROM eng2th WHERE esearch = ?' [word]);
    // if (list.length > 0) {
    //   print(list);
    // } else {
    //   print('Not found');
    // }

    // var list = await _db.query('eng2th',
    //     columns: ['tentry'], where: '"esearch" =?', whereArgs: ['$word']);
    if (list.length > 0) {
    } else {
      print('Not found');
    }
    return list;
  }
}
