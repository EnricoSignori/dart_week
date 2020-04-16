import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/category_model.dart';
import 'package:dart_week_api/model/user_model.dart';

class TransactionModel extends ManagedObject<_TransactionModel>
    implements _TransactionModel {}

@Table(name: 'dw_transaction')
class _TransactionModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column()
  double value;

  @Column()
  String description;

  @Column()
  DateTime createdAt;

  @Relate(#transactions)
  UserModel userModel;

  @Relate(#transactions)
  CategoryModel categoryModel;
}
