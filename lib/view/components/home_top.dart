import 'package:flutter/material.dart';
import 'package:money_tracker/controller/transactions_provider.dart';
import 'package:money_tracker/core/app_colors.dart';
import 'package:money_tracker/view/components/info_card.dart';
import 'package:provider/provider.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionsProvider>(
      context,
    );

    return Container(
      padding: EdgeInsets.only(
        top: 22,
        bottom: 27,
        right: 8,
        left: 8,
      ),
      color: AppColors.primaryColor,
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            "MONEY TRACKER",
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
              fontSize: 13.5,
            ),
          ),
          SizedBox(height: 10),
          const Text(
            "Balance:",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12.5,
            ),
          ),

          Text(
            "\$ ${provider.getBalance().toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              infoCard(
                Icon(
                  Icons.attach_money_rounded,
                  color: AppColors.positive,
                ),
                "Incomes",
                provider.getIncomes(),
              ),
              infoCard(
                Icon(
                  Icons.money_off,
                  color: AppColors.negative,
                ),
                "Expenses",
                provider.getExpenses(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
