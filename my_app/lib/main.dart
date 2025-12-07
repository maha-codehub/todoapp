import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String displayText = "Welcome to Flutter";
  List <String> taskList=[];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo List  App"),
          backgroundColor: Colors.blueAccent,
          centerTitle:false ,
        ),
        body: Column(
          children: [
            Row(
              children: 
              [
                Expanded(child:Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter a task"),
                ),
              ),
            ),
                ),
            MaterialButton(
              color: Colors.blue,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                setState(() {
                
                  taskList.add(controller.text);
                  controller.clear();
                });
              },
              child: Text("Add "),
            ),

              ],

            ),
            Flexible(child: 
           ListView.builder(
            itemCount: taskList.length,
            itemBuilder:(context,index){
              
              return Row( children: [
              Expanded(child :Container(
                padding: EdgeInsets.all(10),
                child: Text(taskList[index]),
                ),
              ),
                MaterialButton(
                  child : Icon(Icons.delete,color :  Colors.red),
                  onPressed: () {
                    setState(() {
                      taskList.removeAt(index);
                    });
                    
                  })
              
           ] );
            }
           )
            ),

          
          ],
        ),
      ),
    );
  }
}
