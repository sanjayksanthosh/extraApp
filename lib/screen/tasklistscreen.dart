import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/proviers/taskProvier.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Taskprovier>(
        builder: (context,value,child) {
          return ListView.builder(
            itemCount: value.taskList.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(value.taskList[index]["title"]),);
            },
          );
        }
      ),
    );
  }
}
