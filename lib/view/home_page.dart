import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:joke_app/Controller/jokeprovider.dart';
import 'package:joke_app/Model/joke_model.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int? index=1;
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<JokeProvider>(context, listen: false).getjoke();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text("JOKES",style: TextStyle(color: Colors.white,letterSpacing: 12,fontSize: 25,fontWeight: FontWeight.w500),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
                onTap: () {
                        Navigator.pushNamed(context, "liked_jokes");
                },
                child: Icon(Icons.thumb_up_alt_outlined,color: Colors.white,size: 30,)),
          ),
        ],
        backgroundColor: Colors.orangeAccent,),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 20),
            height: 600,width: 390,color: Colors.red,
            child: Stack(
              children: [
                Consumer<JokeProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Image.asset("images/${value.index!+1}.jpg",fit: BoxFit.cover,width: double.infinity,height: double.infinity,);
                    }),
                Center(
                  child: Consumer<JokeProvider>(builder: (BuildContext context, JokeProvider value, Widget? child) {
                    return Align(
                        alignment: Alignment.center,
                        child: Text(value.jokestring??"",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 30,),));
                  }),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Spacer(),
              InkWell(
                onTap: () {
                      Provider.of<JokeProvider>(context,listen: false).addtolikedlist();

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to Liked list",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),backgroundColor: Colors.deepOrangeAccent),);
                },
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.deepOrange,width: 5)),
                  child: Icon(Icons.thumb_up_alt_outlined,color: Colors.deepOrange,size: 40,),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Provider.of<JokeProvider>(context, listen: false).getjoke();
                  Provider.of<JokeProvider>(context, listen: false).changephoto();
                },
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.red,width: 5)),
                  child: Icon(Icons.refresh,color: Colors.red,size: 40,),
                ),
              ),
              Spacer(),
              Consumer<JokeProvider>(
                builder: (BuildContext context, JokeProvider value, Widget? child) {
                  return InkWell(
                  onTap: () {
                  },
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.orange,width: 5)),
                    child: Icon(Icons.share,color: Colors.orange,size: 40,),
                  ),
                );
                },
              ),
              Spacer(),
            ],
          )
        ],
      ),

    );
  }
}
