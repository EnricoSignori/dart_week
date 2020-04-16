import 'package:combos/combos.dart';
import 'package:dart_week_mobile/app/models/category_model.dart';
import 'package:dart_week_mobile/app/modules/transaction/components/register_transaction/register_transaction_controller.dart';
import 'package:dart_week_mobile/app/shared/ui/components/controleja_text_form_field.dart';
import 'package:dart_week_mobile/app/shared/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class RegisterTransactionWidget extends StatelessWidget {
  final RegisterTransactionController controller =
      Modular.get<RegisterTransactionController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Form(
          key: controller.globalKey,
          child: Container(
            width: SizeUtils.widthScreen * .7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: SizeUtils.widthScreen,
                  color: Colors.grey[200],
                  child: Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: () async {
                        DateTime date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (date != null) {
                          controller.setDateInsert(date);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              controller.dateInsert == null
                                  ? 'Selecionar Data'
                                  : DateFormat('d/MM/y')
                                      .format(controller.dateInsert),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: !controller.validCategory
                      ? BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        )
                      : null,
                  child: ListCombo(
                    getList: () => controller.categoryModelList,
                    onItemTapped: (item) {
                      controller.changeCategory(item);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        controller.categoryModel?.name ?? 'Categoria',
                      ),
                    ),
                    itemBuilder: (context, parameters, CategoryModel item) =>
                        ListTile(
                      title: Text(item.name),
                    ),
                  ),
                ),
                Visibility(
                  visible: !controller.validCategory,
                  child: Container(
                    width: SizeUtils.widthScreen,
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 14.0,
                    ),
                    child: Text(
                      'Selecione uma categpria',
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ControleJaTextFormField(
                  labelText: 'Descrição',
                  borderRadius: 5,
                  fontSize: 15,
                  padding: EdgeInsets.only(
                    left: 15,
                    top: 15,
                    bottom: 15,
                  ),
                  onChanged: controller.changeDescription,
                  validator: (desc) =>
                      desc.isEmpty ? 'Descrição Obrigatória' : null,
                ),
                SizedBox(
                  height: 20,
                ),
                ControleJaTextFormField(
                  labelText: 'Valor',
                  borderRadius: 5,
                  fontSize: 15,
                  padding: EdgeInsets.only(
                    left: 15,
                    top: 15,
                    bottom: 15,
                  ),
                  controller: controller.moneyMaskedTextController,
                  validator: (value) =>
                      value == '0,00' ? 'Valor Obrigatório' : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
