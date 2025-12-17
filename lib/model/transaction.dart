class Transaction {
  TransactionType type;
  double amount;
  String description;

  Transaction({
    required this.type,
    required this.amount,
    required this.description,
  });
}

// ignore: constant_identifier_names
enum TransactionType { Income, Expense, Invariable }
