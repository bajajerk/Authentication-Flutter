import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  void _onPress(){
    print("Accout balance Asked");
  }
  @override
  Widget build (BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green.shade300,
        title:  new Text("Fancy Day"),
        actions: <Widget>[
          new  IconButton(icon: new Icon(Icons.send), onPressed: ()=> debugPrint ("Pressed")),
          new IconButton(icon: new Icon(Icons.account_balance), onPressed: _onPress),
          new IconButton(icon: new Icon(Icons.scatter_plot), onPressed: null)
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: new Container(
          alignment: Alignment.center,
          child : new Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
              new Text("Hello Body" , style: new TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurple
              ),),
              new InkWell(
                child : new Text("Button"),
                onTap: ()=> debugPrint("Button Tapped"),
              )
            ],
          )
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: ()=>
            debugPrint("Flating Busston {ressed")
//            debugPrint("PRessed")
        ,
        backgroundColor: Colors.green,
        tooltip: 'Going Up',
        child: new Icon(Icons.call_missed),
      ),


      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.add), title: new Text("Add")),
        new BottomNavigationBarItem(icon: new Icon(Icons.print), title: new Text("Print")),
        new BottomNavigationBarItem(icon: new Icon(Icons.access_alarm), title: new Text("Alarm "))
      ], onTap: (int i) => debugPrint ("Hey Touched $i")),



    );

//     Other properties
  }
}
