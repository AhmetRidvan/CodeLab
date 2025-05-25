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
    x();
  }

  Future<void> x() async {
    trueFlag = random5[countQuestion];
    flagImageName = trueFlag.flag_image;
    wrongFlags = await FlagsDao.random3Wrong(trueFlag.flag_id);
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
                Text('True - ', style: TextStyle(fontSize: 18)),
                Text('false - ', style: TextStyle(fontSize: 18)),
              ],
            ),
            Text('Question 1', style: TextStyle(fontSize: 30)),
            Image.asset('images/turkiye.png'),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultScreen(correctNumber: 3);
                      },
                    ),
                  );
                },
                child: Text('Button A'),
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(onPressed: () {}, child: Text('Button B')),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(onPressed: () {}, child: Text('Button C')),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(onPressed: () {}, child: Text('Button D')),
            ),
          ],
        ),
      ),
    );
  }
}
