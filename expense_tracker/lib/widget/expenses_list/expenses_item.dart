import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      // if parrent widget no padding you can wrap child with Padding
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Text(expense.title),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}'),
                  // \ for tell dart that character behide this just a text
                  // toStringAsFixed(2) is method to specific 2 digit number for show
                  const Spacer(),
                  //Spacer can use in any column or row to take all space between each element as much as it can (left-right)
                  Row(
                    children: [
                      Icon(categoryIcon[expense.category]),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(expense.formattedDate)
                    ],
                  ),
                  // another row for group this child
                ],
              )
            ],
          )),
    );
    //Card giving a nice look card (margin border shadow)
  }
}
