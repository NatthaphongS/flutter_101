import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  // can use const because we already separate changing state
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// statefulwidget will always work with 2 class widget class and state class
// second class (state class) should start with _(private class)+Classname+State
// private class is when other file import this file it can't use this class
class _DiceRollerState extends State<DiceRoller> {
  // var activeDiceImage = 'assets/images/dice-1.png';
  var currentDiceRoll = 1;
  // name function
  void rollDice() {
    // var diceRoll = Random().nextInt(6)+1; // 0 < value < 6
    // only one way to make flutter change is make it call build fumction
    // setState provide from State class
    setState(() {
      // activeDiceImage = 'assets/images/dice-$diceRoll.png';
      // $ for inject value into string
      // currentDiceRoll = Random().nextInt(6) + 1;
      // This is not a best way because when you random it will create new object that keep im memory
      currentDiceRoll = randomizer.nextInt(6) + 1;
      // print(currentDiceRoll);
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
          // width 200 = 200px
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          // onPressed: () {},
          // (){} annonymous function
          onPressed: rollDice,
          style: TextButton.styleFrom(
              // padding: const EdgeInsets.only(top: 20,),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 28,
              )),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}
