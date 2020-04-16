import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration3 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("dw_transaction", [SchemaColumn("id", ManagedPropertyType.integer, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("createdAt", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.addColumn("dw_transaction", SchemaColumn.relationship("userModel", ManagedPropertyType.integer, relatedTableName: "dw_user", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("dw_transaction", SchemaColumn.relationship("categoryModel", ManagedPropertyType.integer, relatedTableName: "dw_category", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("dw_category", SchemaColumn("categoryType", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    