import 'package:flutter/material.dart';
import 'package:money_tracker/controller/transactions_provider.dart';
import 'package:money_tracker/core/app_colors.dart';
import 'package:money_tracker/model/transaction.dart';
import 'package:provider/provider.dart';

ListTile infoListItem(
  Transaction transaction,
  BuildContext context,
) {
  final provider = Provider.of<TransactionsProvider>(
    context,
  );
  IconData icono;
  Color color;

  if (transaction.amount == 0) {
    icono = Icons.remove_circle;
    color = Colors.black;
    transaction.type = TransactionType.Invariable;
  } else if (transaction.type == TransactionType.Income) {
    icono = Icons.arrow_circle_up;
    color = AppColors.positive;
  } else {
    icono = Icons.arrow_circle_down;
    color = AppColors.negative;
  }

  return ListTile(
    onLongPress: () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Delete ${transaction.type.name.toLowerCase()}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32),
          ),
          content: Text(
            "Delete ${transaction.type.name.toLowerCase()} ${transaction.description}?",
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      provider.removeTransaction(
                        transaction,
                      );
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(
                            Colors.redAccent,
                          ),
                      foregroundColor:
                          WidgetStatePropertyAll(
                            Colors.white,
                          ),
                    ),
                    child: Text("Si"),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(
                            Colors.green,
                          ),
                      foregroundColor:
                          WidgetStatePropertyAll(
                            Colors.white,
                          ),
                    ),
                    child: Text("No"),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
    leading: Icon(icono, color: color),
    title: Text(transaction.type.name),
    subtitle: Text(transaction.description),
    trailing: Text(
      "\$ ${transaction.amount.toStringAsFixed(2)}",
      style: TextStyle(color: color),
    ),
  );
}
