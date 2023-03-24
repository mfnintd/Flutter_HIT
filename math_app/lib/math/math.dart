import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_app/math/constants.dart';
import 'package:math_app/math/expression.dart';
import './global_variables.dart';
import 'dart:math';

class MathScreen extends StatefulWidget {
  const MathScreen({super.key});

  @override
  State<MathScreen> createState() => _MathScreenState();
}

class _MathScreenState extends State<MathScreen> {
  
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 1), (Timer timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft-= 1;
        });
      }
      else {
        timer.cancel;
        gameOver();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return status == AppStatus.statusHome 
            ? homeScreen() 
            : status == AppStatus.statusPlaying 
              ? playingScreen() 
              : gameOverScreen();
  }

  Widget homeScreen()  {
    timeLeft = timeMax;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.purpleAccent,
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    AppTexts.version,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(height: AppParas.smallDistance,),
              const Text(
                AppTexts.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppParas.largeText,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: AppParas.smallDistance,),

              Container(
                margin: const EdgeInsets.all(8),
                child: TextButton(
                  ///Chuyển qua màn hình chơi
                  onPressed:() {
                    setState(() {
                      currentExpression = Expression();
                      timeLeft = timeMax;
                      status = AppStatus.statusPlaying;
                    });
                  }, 
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(AppParas.largeButton, AppParas.largeButton)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.purpleAccent),
                  ),
                  child: const Text(
                    AppTexts.start,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppParas.smallText,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed:() {
                    //Do something
                    if (level == 'Easy') {
                      level = 'Hard';
                      timeMax = 700;
                    }
                    else {
                      level = 'Easy';
                      timeMax = 3000;
                    }
                  }, 
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(AppParas.largeButton, AppParas.largeButton)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.purpleAccent),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '${AppTexts.changeLevel}: ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppParas.smallText,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        level,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: AppParas.smallText,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///Trang chơi
  Widget playingScreen() {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.purple,
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          color: Colors.white
                        ),
                        width: MediaQuery.of(context).size.width * timeLeft / timeMax,
                        height: AppParas.heightTimer,
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - AppParas.heightTimer - AppParas.smallestDistance * 4,
                    margin: const EdgeInsets.symmetric(vertical: AppParas.smallestDistance),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$score',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: AppParas.largeText
                          ),
                        ),
                        Text(
                          currentExpression.toString(),
                          
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: AppParas.largeText
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ///nút đúng
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              padding: const EdgeInsets.all(16),
                              child: IconButton(
                                onPressed: () {
                                  if (currentExpression.isCorrect) {
                                    clickCorrectAnswer();
                                  }
                                  ///game kết thúc
                                  else {
                                    gameOver();
                                  }
                                },
                                icon: const Icon(Icons.check),
                                iconSize: AppParas.iconLargeSize,
                                color: Colors.blue,
                              ),
                            ),
                            ///nút sai
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              padding: const EdgeInsets.all(16),
                              child: IconButton(
                                onPressed: () {
                                  if (!currentExpression.isCorrect) {
                                    clickCorrectAnswer();
                                  }
                                  ///game kết thúc
                                  else {
                                    gameOver();
                                  }
                                },
                                icon: const Icon(Icons.close),
                                iconSize: AppParas.iconLargeSize,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ///Khi chọn đáp án đúng
  void clickCorrectAnswer() {
    setState(() {
      score++;
      currentExpression = Expression();
      timeLeft = timeMax;
    });
  }
  ///Khi chọn đáp án sai
  void gameOver() {
    setState(() {
      status = AppStatus.statusGameOver;
    });
  }
  ///Trang kết thúc
  Widget gameOverScreen() {
    highestScore = max(highestScore, score);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.purple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppTexts.gameOverTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppParas.largeText,
                  fontWeight: FontWeight.bold
                ),
            
              ),
              Text(
                '${AppTexts.yourScore}$score',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppParas.smallText
                ),
              ),
              Text(
                '${AppTexts.bestScore}$highestScore',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppParas.smallText
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: AppParas.mediumButton,
                    width: AppParas.mediumButton,
                    margin: const EdgeInsets.all(AppParas.smallestDistance),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: IconButton(
                      ///Nút chơi lại
                      onPressed:() {
                        setState(() {
                          score = 0;
                          currentExpression = Expression();
                          timeLeft = timeMax;
                          status = AppStatus.statusPlaying;
                        });
                      }, 
                      icon: const Icon(Icons.refresh),
                      iconSize: AppParas.iconSmallSize,
                      color: Colors.purple,
                    ),
                  ),
                  
                  ///Nút về trang chủ
                  Container(
                    height: AppParas.mediumButton,
                    width: AppParas.mediumButton,
                    margin: const EdgeInsets.all(AppParas.smallestDistance),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: IconButton(
                      ///Trang chủ
                      onPressed:() {
                        setState(() {
                          score = 0;
                          timeLeft = timeMax;
                          status = AppStatus.statusHome;
                        });
                    }, 
                      icon: const Icon(Icons.menu),
                      iconSize: AppParas.iconSmallSize,
                      color: Colors.blue,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

///Trang chủ
