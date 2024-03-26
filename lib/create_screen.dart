import 'package:flutter/material.dart';
import 'package:user_list/databaseservice.dart';

import 'package:user_list/tomodel.dart';

class Screencreate extends StatefulWidget {
  final Usermodels? list;
  const Screencreate({super.key, this.list});

  @override
  State<Screencreate> createState() => _ScreencreateState();
}

bool _isobsecure = true;

class _ScreencreateState extends State<Screencreate> {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  int? id;
  bool isEdit = false;
  @override
  void initState() {
    var list = widget.list;
    if (list == null) {
    } else {
      usercontroller.text = list.username;
      passcontroller.text = list.password;
      phonenumbercontroller.text = list.number;
      id = list.id;
      isEdit = true;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 255, 196, 0),
            title: const Text(
              "Add Data User ",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: usercontroller,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    hintText: "Username",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: phonenumbercontroller,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.phone),
                  hintText: "PhoneNumber",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLength: 10,
                controller: passcontroller,
                obscureText: _isobsecure,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isobsecure = !_isobsecure;
                      });
                    },
                    child: Icon(
                      _isobsecure ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  hintText: "Password",
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Usermodels usermodels = Usermodels(
                      username: usercontroller.text,
                      number: phonenumbercontroller.text,
                      password: passcontroller.text);
                  await DatabaseService()
                      .createlist(usermodels)
                      .whenComplete(() {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 196, 0),
                ),
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
