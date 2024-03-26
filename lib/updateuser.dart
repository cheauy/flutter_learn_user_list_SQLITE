import 'package:flutter/material.dart';

class Updateuser extends StatefulWidget {
  const Updateuser({super.key});

  @override
  State<Updateuser> createState() => _UpdateuserState();
}

class _UpdateuserState extends State<Updateuser> {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  int? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update user")),
      body: Column(
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
            decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.visibility,
              ),
              hintText: "Password",
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
