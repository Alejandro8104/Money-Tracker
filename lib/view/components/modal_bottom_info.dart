import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/controller/transactions_provider.dart';
import 'package:money_tracker/core/app_colors.dart';
import 'package:money_tracker/model/transaction.dart';
import 'package:provider/provider.dart';

class ModalBottomInfo extends StatefulWidget {
  const ModalBottomInfo({super.key});

  @override
  State<ModalBottomInfo> createState() =>
      _ModalBottomInfoState();
}

class _ModalBottomInfoState extends State<ModalBottomInfo> {
  int? position = 0;

  Transaction newTransaction = Transaction(
    type: TransactionType.Income,
    description: "Sin descripcion",
    amount: 0.0,
  );

  final CurrencyTextInputFormatter currencyFormatter =
      CurrencyTextInputFormatter.currency(
        enableNegative: false,
        decimalDigits: 2,
        inputDirection: InputDirection.left,
        symbol: '\$ ',
      );

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionsProvider>(
      context,
    );

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
      child: Column(
        spacing: 20,
        children: [
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            "New Transaction",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 20,
            ),
          ),
          CupertinoSlidingSegmentedControl(
            groupValue: position,
            onValueChanged: (value) {
              newTransaction.type = value == 0
                  ? TransactionType.Income
                  : TransactionType.Expense;
              setState(() {
                position = value;
              });
            },
            children: {
              0: Text("Income"),
              1: Text("Expense"),
            },
          ),
          Text(
            "Amount",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 18,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            maxLines: 1,
            maxLength: 9,
            keyboardType: TextInputType.number,
            inputFormatters: [currencyFormatter],
            onChanged: (value) => newTransaction.amount =
                double.tryParse(value) ?? 0.0,
            decoration: InputDecoration.collapsed(
              hintText: "\$ 0.00",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          Text(
            "Description",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 18,
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            maxLength: 35,
            maxLines: 1,
            onChanged: (value) {
              if (value.trim() == "") {
                newTransaction.description =
                    "Sin descripcion";
              } else {
                newTransaction.description = value;
              }
            },
            decoration: InputDecoration.collapsed(
              hintText: "Sin descripcion",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                provider.addTransaction(newTransaction);
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.primaryColor,
                ),
              ),
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
