import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  // const StartScreen(void Function() startQuiz, {super.key});
  // void Function() startQuiz mean accept 1 position arrgument whice should be a function that take no argument and no return but it not enough for use in this class so

  const StartScreen(this.startQuiz, {super.key});
  // const in front of consturctor function : for unlock the usege of const when instantiating the class

  final void Function() startQuiz;
  // mean when accept first arrgument that value wil assign to startQuiz variable

  @override
  Widget build(context) {
    return Center(
      // Center widget will take space as much as it can and align child to center
      // in this case all of parent of this Center widget not not take any space so center will cover all screen this sutiation make all parent full fill the screen too.
      child: Column(
        // default Column will take all height and width as its content
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.8,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          // we should not use Opacity if we can't
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
            // Color can deep into your image
          ),

          const SizedBox(
            height: 80,
          ),
          // SizedBox use for make space between element their size will as much as we specify
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 24,
            ),
            // style for using TextStyle use for modify this text widget
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Start Quiz',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_right_alt,
                  size: 40,
                )
              ],
            ),
            /* if OutlinedButton.icon use this instead child but icon will always on left
            icon: const Icon(
              Icons.arrow_right_alt,
            ),
            // icon can use very where that allow icon
            label: const Text(
              'Start Quiz',
              style: TextStyle(fontSize: 20),
            ),
            */
          )
        ],
      ),
    );
  }
}
