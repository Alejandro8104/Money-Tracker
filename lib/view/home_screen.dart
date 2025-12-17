import 'package:flutter/material.dart';
import 'package:money_tracker/view/components/home_bottom.dart';
import 'package:money_tracker/view/components/home_top.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  double incomes = 1000.0;
  double expenses = 500.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(children: [HomeTop(), HomeBottom()]),
    );
  }
}
