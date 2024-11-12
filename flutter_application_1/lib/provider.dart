import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
class IncrementCountersProvider with ChangeNotifier{

 int sobhan = 0;
  int alhamd = 0;
  int laaaelaha = 0;
  int alla = 0;

 get showSobhan=>sobhan;

   incrementsobhan() {
      sobhan++;
      notifyListeners();
  }


get showalhamd=>alhamd;

   incrementalhamd() {
     alhamd++;
      notifyListeners();
  }

  get showlaaaelaha=>laaaelaha;

   incrementlaaaelaha() {
      laaaelaha++;
      notifyListeners();
  }

  get showalla=>sobhan;

   incrementalla() {
      alla++;
      notifyListeners();
  }


setVariables(){
   sobhan = 0;
  alhamd = 0;
  laaaelaha = 0;
 alla = 0;
  notifyListeners();

}














  
}