import 'package:flutter/material.dart';
import 'package:quiz_app/core/api_client.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/data/raw_data.dart';
import 'package:quiz_app/themes/app_color.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Question currentQuestion =
      getRandomQuestion(ApiClient.getInstance().getLocalQuestions());
  int index = 1;
  int score = 0;

  void checkAnswer(int answerIndex) {
    setState(() {
      index++;
      if (answerIndex == currentQuestion.answerIndex) {
        // Update the score
        score++;
      }
      // Get the next question
      currentQuestion = getRandomQuestion(questionList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                'QUIZ GAME',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(height: 64),
              // Question
              Text(
                'Question $index: ${currentQuestion.question}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              // Choices
              for (int i = 0; i < currentQuestion.options.length; i++)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    onPressed: () => checkAnswer(i),
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      minimumSize: Size(double.infinity, 56),
                    ),
                    child: Text(
                      currentQuestion.options[i],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 48),
              // Score
              Text(
                'Your score is $score',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Question getRandomQuestion(List<Question> questionList) {
  final randomIndex = questionList.asMap().keys.toList()..shuffle();
  return questionList[randomIndex.first];
}
