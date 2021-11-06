import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txt = TextEditingController();

  var student_names = [];

  var name = "";

  add_student() {
    setState(() {
      student_names.add(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Safiullah's TODO App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Center(
              child: Text(
                "Enter the student name to add: ",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                controller: txt,
                onChanged: (value) {
                  name = value;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                add_student();
              },
              child: Text("Add Student"),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: student_names.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        tileColor: Colors.blue.shade800,
                        title: Text(
                          "${student_names[index]}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  student_names.remove(student_names[index]);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
