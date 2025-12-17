import 'package:flutter/material.dart';
import 'package:money_tracker/controller/transactions_provider.dart';
import 'package:money_tracker/view/components/info_list_item.dart';
import 'package:provider/provider.dart';

class HomeBottom extends StatefulWidget {
  const HomeBottom({super.key});
  static List<ListTile> hijos = [];

  @override
  State<HomeBottom> createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionsProvider>(
      context,
    );
    final transactions = provider.getTransactions();

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return infoListItem(transactions[index], context);
      },
      shrinkWrap: true,
    );
  }
}
