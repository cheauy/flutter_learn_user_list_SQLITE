import 'package:flutter/material.dart';

import 'package:user_list/custom_text_style.dart';
import 'package:user_list/databaseservice.dart';
import 'package:user_list/tomodel.dart';
import 'package:user_list/updateuser.dart';

class Editscreen extends StatefulWidget {
  final Usermodels? list;
  const Editscreen({super.key, this.list});

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit user"),
        actions: [
          InkWell(
            onTap: () async {
              Usermodels usermodels = Usermodels(
                  username: usercontroller.text,
                  number: phonenumbercontroller.text,
                  password: passcontroller.text);
              await DatabaseService().updatelist(usermodels, id!);
            },
            child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "User Detail",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        height: 100,
                        width: double.infinity,
                        child: ListTile(
                            title: const Text(
                              "Name",
                              style: editTextstyle.editOfTextStyle,
                            ),
                            subtitle: Text(widget.list!.username),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit_square),
                            ))),
                    Container(
                        padding: const EdgeInsets.all(10),
                        height: 100,
                        width: double.infinity,
                        child: ListTile(
                            title: const Text(
                              "Phone Number",
                              style: editTextstyle.editOfTextStyle,
                            ),
                            subtitle: Text(widget.list!.number),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit_square),
                            ))),
                    Container(
                        padding: const EdgeInsets.all(10),
                        height: 100,
                        width: double.infinity,
                        child: ListTile(
                            title: const Text(
                              "Password",
                              style: editTextstyle.editOfTextStyle,
                            ),
                            subtitle: Text(widget.list!.password),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Updateuser()));
                              },
                              icon: const Icon(Icons.edit_square),
                            ))),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await DatabaseService().deletelist(widget.list!.id!).whenComplete(() {
            Navigator.pop(context);
          });
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
