import 'dart:convert';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:joke_app/Model/joke_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic>? jokes;


class JokeProvider extends ChangeNotifier{

  String? jokestring;
  String? iconstring;
  int? index=1;
  List<String> likedlist=[];
  List icon=[];
 void getjoke() async{

   Response res=await get(Uri.parse("https://api.chucknorris.io/jokes/random?_gl=1*ph5aj1*_ga*MTk0Mjk5OTM5OS4xNzAyNTI1NTQ1*_ga_ZCYG64C7PL*MTcxODg1MTMyMi4xMS4xLjE3MTg4NTI0ODUuMC4wLjA."));
    jokes = jsonDecode(res.body);
   jokestring=jokes?["value"];
   iconstring=jokes?["icon_url"];
   notifyListeners();

 }

 void addtolikedlist(){
   likedlist.add(jokestring??"");
   icon.add(iconstring);
   savejoke();
   notifyListeners();

 }

 void deletelikedjoke(int delete){
   likedlist.removeAt(delete);
   notifyListeners();
 }

 void savejoke() async {
   SharedPreferences pref = await SharedPreferences.getInstance();
   pref.setStringList("likedlist", likedlist);
   notifyListeners();
 }

   void getsavejoke() async {
     SharedPreferences pref = await SharedPreferences.getInstance();
     pref.getStringList("likedlist");
     notifyListeners();
   }

   void changephoto(){
     index=Random().nextInt(6);
   }
}