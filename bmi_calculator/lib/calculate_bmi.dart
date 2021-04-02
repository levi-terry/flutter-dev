import 'dart:math';

class Calculator{
  final int height;
  final int weight;
  double _bmi;

  Calculator({this.height, this.weight});

  String calculateBMI(){
    _bmi = weight / pow(height, 2) * 703;
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return "OVERWEIGHT";
    }
    else if(_bmi > 18.5){
      return "NORMAL";
    }
    else{
      return "UNDERWEIGHT";
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return "You have a higher than normal body weight. Try to watch what you eat and exercise more.";
    }
    else if(_bmi > 18.5){
      return "You have a normal body weight. Great job!";
    }
    else{
      return "You have a lower than normal body weight. Try eating more.";
    }
  }
}