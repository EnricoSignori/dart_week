import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration2 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(
      SchemaTable(
        "dw_category",
        [
          SchemaColumn(
            "id",
            ManagedPropertyType.integer,
            isPrimaryKey: true,
            autoincrement: false,
            isIndexed: false,
            isNullable: false,
            isUnique: false,
          ),
          SchemaColumn(
            "name",
            ManagedPropertyType.string,
            isPrimaryKey: false,
            autoincrement: false,
            isIndexed: false,
            isNullable: false,
            isUnique: false,
          )
        ],
      ),
    );
    database.addColumn(
      "dw_user",
      SchemaColumn(
        "password",
        ManagedPropertyType.string,
        isPrimaryKey: false,
        autoincrement: false,
        isIndexed: false,
        isNullable: false,
        isUnique: false,
      ),
    );
    database.deleteColumn("dw_user", "senha");
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {}
}
