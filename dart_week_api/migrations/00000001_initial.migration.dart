import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(
      SchemaTable(
        "dw_user",
        [
          SchemaColumn(
            "id",
            ManagedPropertyType.integer,
            isPrimaryKey: true,
            autoincrement: true,
            isIndexed: false,
            isNullable: false,
            isUnique: false,
          ),
          SchemaColumn(
            "login",
            ManagedPropertyType.string,
            isPrimaryKey: false,
            autoincrement: false,
            isIndexed: false,
            isNullable: false,
            isUnique: true,
          ),
          SchemaColumn(
            "senha",
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
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {}
}
