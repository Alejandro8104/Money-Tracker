import 'package:flutter/material.dart';
import 'package:money_tracker/model/transaction.dart';

class TransactionsProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [];

  List<Transaction> getTransactions() {
    return [..._transactions];
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  Transaction removeTransaction(Transaction transaction) {
    _transactions.remove(transaction);
    notifyListeners();
    return transaction;
  }

  double getIncomes() {
    double totalIncomes = 0;
    for (var transaccion in _transactions) {
      if (transaccion.type == TransactionType.Income) {
        totalIncomes += transaccion.amount;
      }
    }
    return totalIncomes;
  }

  double getExpenses() {
    double totalExpenses = 0;
    for (var transaccion in _transactions) {
      if (transaccion.type == TransactionType.Expense) {
        totalExpenses += transaccion.amount;
      }
    }
    return totalExpenses;
  }

  double getBalance() {
    return getIncomes() - getExpenses();
  }
}
