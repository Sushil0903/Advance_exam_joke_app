import 'package:flutter/material.dart';
import 'package:joke_app/Controller/jokeprovider.dart';
import 'package:provider/provider.dart';

class Likedjoked extends StatefulWidget {
  const Likedjoked({super.key});

  @override
  State<Likedjoked> createState() => _LikedjokedState();
}


class _LikedjokedState extends State<Likedjoked> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Provider.of<JokeProvider>(context,listen: false).getsavejoke();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(backgroundColor: Colors.orange,foregroundColor: Colors.white,
      title: Text("Liked  Jokes",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
      ),
      body: Consumer<JokeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return ListView.builder(
          itemCount: value.likedlist.length,
          itemBuilder: (context, index) {
          return Container(
            child: Row(
              children: [
                Container(width: 80,child: Image.network(value.icon[index]??""),),
                Container(
                  color: Colors.transparent,
                  width: 240,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(value.likedlist[index],style: TextStyle(fontSize: 16,color: Colors.white),),),
                ),
                Transform.translate(
                    offset: Offset(20,-5),
                    child: InkWell(
                        onTap: () {
                          Provider.of<JokeProvider>(context,listen: false).deletelikedjoke(index);
                        },
                        child: Icon(Icons.delete_outline,size: 40,color: Colors.white,)))
              ],
            ),
            margin: EdgeInsets.all(10),
            color: Colors.orange,width: 100,);
        },);
        },
      ),
    );
  }
}
