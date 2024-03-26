import 'package:flutter/material.dart';
import 'package:user_list/create_screen.dart';
import 'package:user_list/custom_text_style.dart';

import 'package:user_list/databaseservice.dart';
import 'package:user_list/editscreen.dart';
import 'package:user_list/tomodel.dart';

//import 'custom_text_style.dart';

class Homesceen extends StatefulWidget {
  const Homesceen({super.key});

  @override
  State<Homesceen> createState() => _HomesceenState();
}

class _HomesceenState extends State<Homesceen> {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  int? id;
  List<Usermodels> usermodel = [];
  bool loading = true;
  Future<void> showlist() async {
    await DatabaseService().readlist().then((value) {
      setState(() {
        usermodel = value;
        loading = false;
      });
    });
  }

  @override
  void initState() {
    showlist(); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(242, 245, 248, 250),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.tealAccent,
          title: const Text("Data User"),
        ),
        body: SingleChildScrollView(
          child: loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    await showlist();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(color: Colors.black, width: 3),
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 3,
                          ),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: const Text(
                              "ID",
                              style: CustomTextStyle.nameOfTextStyle,
                            )),
                            Container(
                              child: const Text("Name",
                                  style: CustomTextStyle.nameOfTextStyle),
                            ),
                            Container(
                              child: const Text("Phone Number",
                                  style: CustomTextStyle.nameOfTextStyle),
                            ),
                            Container(
                              child: const Text("Password",
                                  style: CustomTextStyle.nameOfTextStyle),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: usermodel.length,
                            itemBuilder: (context, index) {
                              var user = usermodel[index];
                              return Container(
                                height: 30,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Editscreen(
                                                  list: usermodel[index])));
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          user.id.toString(),
                                          style: usertextstyle.userOfTextStyle,
                                        ),
                                      ),
                                      Container(
                                        child: Text(user.username,
                                            style:
                                                usertextstyle.userOfTextStyle),
                                      ),
                                      Container(
                                        child: Text(user.number,
                                            style:
                                                usertextstyle.userOfTextStyle),
                                      ),
                                      Container(
                                        child: Text(user.password,
                                            style:
                                                usertextstyle.userOfTextStyle),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ]),
                  ),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Screencreate()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
