import 'package:first_project/dice_roller.dart';
import 'package:flutter/material.dart';

// Custom widget class must extends StatelessWidget it will give tons of data for this class to be widget
/*
class GradiantContainer extends StatelessWidget {
  // Should add annotation @override before build method

  // Constructors
  // GradiantContainer({key}):super(key:key);
  // {} for accept name arrgument to name parameter
  // : for reach out to parent class
  // super = constructor function of parent class
  // shortcut
  const GradiantContainer({super.key, required this.colors});

  final List<Color> colors;
  @override
  Widget build(context) {
    // when flutter run and find widget it will auto call build method and flutter will give value of ctx(context) such as position of this widget

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      // Container not support const
      child: const Center(
        // Center is one of layout widgets
        child: StyledText('Hello world!'),
      ),
    );
  }
}
*/

class GradiantContainer extends StatelessWidget {
  // StatelessWidget not support changing data change to StatefulWidget
  const GradiantContainer(this.color1, this.color2, {super.key});

  // add another constructor
  const GradiantContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    // when flutter run and find widget it will auto call build method and flutter will give value of ctx(context) such as position of this widget

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      // Container not support const
      child: const Center(
        // Center is one of layout widgets
        child: DiceRoller(),
      ),
    );
  }
}
