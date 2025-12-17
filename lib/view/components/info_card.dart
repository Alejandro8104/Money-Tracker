import 'package:flutter/material.dart';

Widget infoCard(Icon icon, String title, double amount) {
  return Expanded(
    child: Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon, Text(title)],
            ),
            Text(
              "\$ ${amount.toStringAsFixed(2)}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    ),
  );
}
