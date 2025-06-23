import 'package:flag_quiz_app/flags_dao.dart';
import 'package:flag_quiz_app/model/flags.dart';
import 'package:flag_quiz_app/views/result_screen.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var random5 = <FlagModel>[];
  var wrongFlags = <FlagModel>[];
  late FlagModel trueFlag;
  List<FlagModel> allOptions = [];
  int countQuestion = 0;
  int countCorrect = 0;
  int countWrong = 0;
  String flagImageName = 'placeholder.png';
  String buttonA = '';
  String buttonB = '';
  String buttonC = '';
  String buttonD = '';

  @override
  void initState() {
    bringThemAll();
    super.initState();
  }

  Future<void> bringThemAll() async {
    random5 = await FlagsDao.random5();
    _loadInitialQuizData();
  }

  Future<void> _loadInitialQuizData() async {
    trueFlag = random5[countQuestion];
    flagImageName = trueFlag.flag_image;
    wrongFlags = await FlagsDao.random3Wrong(trueFlag.flag_id);

    allOptions.clear();
    allOptions.add(trueFlag);
    allOptions.addAll(wrongFlags);
    allOptions.shuffle();

    buttonA = allOptions[0].flag_name;
    buttonB = allOptions[1].flag_name;
    buttonC = allOptions[2].flag_name;
    buttonD = allOptions[3].flag_name;
    setState(() {});
  }

  void countControl() {
    countQuestion++;
    if (countQuestion != 5) {
      _loadInitialQuizData();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return ResultScreen(correctNumber: countCorrect);
          },
        ),
      );
    }
  }

  void correctControl(String buttonText) {
    if (buttonText == trueFlag.flag_name) {
      countCorrect++;
    } else {
      countWrong++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('True - $countCorrect', style: TextStyle(fontSize: 18)),
                Text('false - $countWrong', style: TextStyle(fontSize: 18)),
              ],
            ),
            countQuestion != 5
                ? Text(
                    'Question ${countQuestion + 1}',
                    style: TextStyle(fontSize: 30),
                  )
                : Text('Question 5', style: TextStyle(fontSize: 30)),
            Image.asset('images/$flagImageName'),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  correctControl(buttonA);
                  countControl();
                },
                child: Text(buttonA),
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  correctControl(buttonB);
                  countControl();
                },
                child: Text(buttonB),
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  correctControl(buttonC);
                  countControl();
                },
                child: Text(buttonC),
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  correctControl(buttonD);
                  countControl();
                },
                child: Text(buttonD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
