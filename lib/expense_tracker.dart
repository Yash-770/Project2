import 'package:expense_tracker/expense_list.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});
  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<Expense> registeredExpenses = [
    Expense(
        title: "phone",
        amount: 259.36,
        date: DateTime.now(),
        category: Category.luxury),
    Expense(
        title: "books",
        amount: 25.36,
        date: DateTime.now(),
        category: Category.study),
  ];

  void addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      registeredExpenses.remove(expense);
    });
  }

  void openOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(onPressedSave: addExpense);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ExpensesApp"),
        actions: [
          IconButton(onPressed: openOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text("Hello"),
            Expanded(
               
                child: ExpenseList(registeredExpenses,onDissmissed: removeExpense,)),
          ],
        ),
      ),
    );
  }
}
