import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  /*
  var _enteredTitle = '';

  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
    // we not need to wrap with setState because we just want to up date value in variable not update ui
  }
  */
  // this not work with many input field

  final _titleController = TextEditingController();
  // TextEditingController() is a object that controll the input
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    // set first date to today minus one year.
    final pickedDate = await showDatePicker(
      // this is future object that will reture the result in the future
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
    );
    //first way to use vaule from the future
    // .then((value) => null);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {}

  @override
  void dispose() {
    // this method run after widget was destroyed
    // only statefulWidget can use dispose
    _titleController.dispose();
    // for delete TextEditingController(); when you don't need to use because if not it will always take your memory.
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Input
          TextField(
            // onChanged: _saveTitleInput,
            controller: _titleController,
            maxLength: 50,
            // specific length of character
            keyboardType: TextInputType.text,
            // specific how keyboard look like
            decoration: const InputDecoration(
              label: Text('Title'),
              // seem like placeholder on input
            ),
          ),
          Row(
            children: [
              // we wrap expanded because we want it to take as much as area.(default of text field not specific area)
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'No date selected'
                      : formatter.format(_selectedDate!)),
                  // ! mean we tell dart that parameter will not be null
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  )
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      // items need a list of dropdownitem
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase())))
                      // category.name is a property for enum item
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                      // because user can select notthing
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // this context is from build method arrgument
                  // pop will remove this overlay from the screen
                },
                child: const Text('Cancle'),
              ),
              ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}
