import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/Controller/jokeprovider.dart';
import 'package:joke_app/view/splash_screen.dart';
import 'package:provider/provider.dart';

import 'view/home_page.dart';
import 'view/liked_jokes.dart';

void main(){
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => JokeProvider(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/":(context) => Splash(),
          "home_page":(context) => Homepage() ,
          "liked_jokes":(context) => Likedjoked(),
        },
      ),
    );
  }
}
