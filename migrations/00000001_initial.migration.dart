import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_Fabricante", [
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("name", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true),
    ]));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    final fabricanteNames = [
      "Alcatel",
      "BBK Electronics",
      "BenQ",
      "BlackBerry",
      "Blu Products",
      "Ericsson",
      "Gionee",
      "Gradiente",
      "HMD Global",
      "Huawei",
      "J.C.Bamford",
      "Jolla",
      "Kyocera",
      "Lenovo",
      "LG Electronics",
      "Microsoft Mobile",
      "Motorola",
      "Multilaser",
      "Nokia",
      "OnePlus",
      "Palm, Inc.",
      "Pantech Curitel",
      "Quantum",
      "Realme",
      "Samsung",
      "Sanyo",
      "Sharp Corporation",
      "Sony",
      "TCL Corporation",
      "Toshiba",
      "Vertu",
      "Vivo",
      "Xiaomi",
      "Xtouch",
      "ZTE"
    ];

    for (final fabricanteName in fabricanteNames) {
      await database.store.execute(
          "INSERT INTO _Fabricante (name) VALUES (@name)",
          substitutionValues: {"name": fabricanteName});
    }
  }
}
