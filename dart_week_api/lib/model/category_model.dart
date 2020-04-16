import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/transaction_model.dart';

class CategoryModel extends ManagedObject<_CategoryModel>
    implements _CategoryModel {}

enum CategoryType {
  revenue,
  expense,
}

@Table(name: 'dw_category')
class _CategoryModel {
  @Column(primaryKey: true)
  int id;

  @Column()
  String name;

  @Column()
  CategoryType categoryType;

  ManagedSet<TransactionModel> transactions;
}
