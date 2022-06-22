import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(RandomSelector());

class RandomSelector extends StatelessWidget {
  const RandomSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> name = [];

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Random Name Selector",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: name.length,
                itemBuilder: (context, index){
                  return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          name.removeAt(index);
                        });
                      },
                    child: ListTile(
                      title: Text(name[index]),
                    ),
                  );
                },
              )
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Add new Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child:TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                                isDense: true,
                              ),
                            ),
                        ),
                        RaisedButton(
                            child: Text("Add"),
                            onPressed: (){
                              addToList();

                            }
                            ),
                        RaisedButton(
                            child: Text("Delete"),
                            onPressed: (){
                              DeleteFromList();


                            }
                        )

                      ],
                    ),
                    Builder(builder: (context) => RaisedButton(
                        child: Text("Get Random Name"),
                        onPressed: () {
                          var random = Random();
                          Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Random name is : " + name[random.nextInt(name.length)]))
                          );

                        }
                      )
                    )
                  ],
                ),
          ))
        ],
      ),
    );
  }

  void addToList (){
    if(nameController.text.isNotEmpty) {
      setState(() {
        name.add(nameController.text);
      });
    }
  }
  void DeleteFromList (){
    if(nameController.text.isNotEmpty) {
      setState(() {
        name.remove(nameController.text);
      });
    }
  }

}


