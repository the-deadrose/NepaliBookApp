



import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = ChangeNotifierProvider((ref) => CounterProvider());

class CounterProvider extends ChangeNotifier{
  int number = 0;

  void addNumber(){
      number++;
      notifyListeners();
  }

  void subNumber(){
      number--;
      notifyListeners();

  }

}