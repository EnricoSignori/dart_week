import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/transaction_model.dart';

class UserModel extends ManagedObject<_UserModel> implements _UserModel {}

@Table(name: 'dw_user')
class _UserModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column(unique: true)
  String login;

  @Column()
  String password;

  ManagedSet<TransactionModel> transactions;
}
