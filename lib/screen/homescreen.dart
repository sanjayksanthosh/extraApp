import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/proviers/taskProvier.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    var titleCtr = TextEditingController();
    var descriptionCtr = TextEditingController();
    final provier = Provider.of<Taskprovier>(context);
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: titleCtr,
          ),
          TextField(
            controller: descriptionCtr,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    provier.postTask(titleCtr.text, descriptionCtr.text);
                  },
                  child: Text("Post")),
              ElevatedButton(
                  onPressed: () {
                    provier.getTask();
                  },
                  child: Text("get"))
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provier.taskList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(provier.taskList[index]["title"]),
                          Text(provier.taskList[index]["description"]),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            provier.updateTask(
                                titleCtr.text,
                                descriptionCtr.text,
                                provier.taskList[index]["_id"]);
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            provier.deleteTask(
                               
                                provier.taskList[index]["_id"]);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
