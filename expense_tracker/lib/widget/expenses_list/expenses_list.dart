import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    // Column not best in this sutiation because we not know how many of length (100 maybe 1000) that create instance that sure you just see in some item so this solution are low efficient.
    // if use ListView(children:[]) that can scrollable but it still create all list same.
    // ListView.builder is a special that will create item just you will see or almost see so this is the best of this list
    return ListView.builder(
      itemCount: expenses.length,
      // add number of items that will render
      itemBuilder: (ctx, index) => ExpensesItem(expenses[index]),
      // itemBuilder will execute up to itemCount rounds and for each round index will +1(start with 0)
    );
  }
}
