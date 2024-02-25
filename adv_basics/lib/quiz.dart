import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // var activeScreen = const StartScreen();
  // store widget in variable (this can do because widget is an object)
  // replace var to widget because we want to reduce type from StartScreen type to be a widget type so this variable can change to other widget

  // first way to condition render use initState
  /*
  Widget? activeScreen;
  // still error because we use switchScreen before initalizer we fix by use initState

  @override
  void initState() {
    // initState will be call after this object was created(don't mean run build method just classname()) and stored in memory and sure it run before build method
    super.initState();
    // super should be the first before do anything
    activeScreen = StartScreen(switchScreen);
  }

  switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
    // when you call setState in StatefulWidget it will lead to excute build method again after that will compare before and after if difference it will update that UI
  }
  */

  // secondway to condition render
  var activeScreen = 'start_screen';

  switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions_screen';
    });
  }

  List<String> selectedAnswer = [];

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  @override
  Widget build(context) {
    // final screenWidget = activeScreen == 'start_screen'
    //     ? StartScreen(switchScreen)
    //     : QuestionsScreen(onSelectAnswer: chooseAnswer);

    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions_screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'results_screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      // root widget
      // const is for allows dart to reuse the object
      home: Scaffold(
        // home is a property in material app that will specify which widget will be a start main screen when app start
        // Scaffold is a layout base structure in our app provide(app bars(top bar), drawers(side bar), snack bars(notification bar), floating action buttons.), and etc.
        body: Container(
          // Container allow us to use decoration
          // width and height is will up to a content inside
          decoration: const BoxDecoration(
            // Box decoration for design the box in this is for set gradient
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 3, 14, 110),
                Color.fromARGB(255, 4, 55, 150)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen),
          child: screenWidget,
        ),
      ),
    );
  }
}
