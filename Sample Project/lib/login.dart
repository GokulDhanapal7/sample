
import 'package:flutter/material.dart';
import 'package:sample_project/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late  TextEditingController usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // ignore: unused_field
  late String _savedData;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    _loadData();
  }

  // Load data from SharedPreferences
  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedData = prefs.getString('data') ?? '';
    });
  }

  // Save data to SharedPreferences
  Future<void> _saveData(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', data);
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // return  Scaffold(
    //   body:SafeArea(
    //     child: Container(
    //       decoration: const BoxDecoration(
    //         gradient: LinearGradient(
    //             colors: [
    //               Color(0xff0aecf3),
    //               Color(0xff136c69),
    //             ]
    //         )
    //       ),
    //       padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
    //       child:   Column(
    //       children: [
    //       // const Text("Welcome to ",style: TextStyle(fontSize: 30, color: Colors.white),),
    //       const Text("Sign In",style: TextStyle(fontSize: 30, color: Colors.white),),
    //         const SizedBox(height: 50,),
    //            const Center(
    //              child: Icon(
    //                Icons.account_circle,
    //                size: 200,
    //                color: Colors.white,
    //              ),
    //            ),
    //         const SizedBox(height: 15,),
    //         TextFormField(
    //           maxLength: 30,
    //           textInputAction: TextInputAction.next,
    //           controller: usernameController,
    //           autovalidateMode: AutovalidateMode.onUserInteraction,
    //           style: const TextStyle(fontSize: 14),
    //           decoration: InputDecoration(
    //             hintText: 'Username',
    //             counterText: "",
    //             filled: true,
    //             suffixIcon: IconButton(
    //               icon: const Icon(Icons.clear),
    //               splashRadius: 10,
    //               onPressed: () {
    //                 usernameController.clear();
    //               },
    //             ),
    //             fillColor: Colors.blueGrey[50],
    //             enabledBorder: OutlineInputBorder(
    //               borderSide: BorderSide(color: Colors.blueGrey.shade50),
    //               borderRadius: BorderRadius.circular(15),
    //             ),
    //             focusedBorder: OutlineInputBorder(
    //               borderSide: const BorderSide(color: Colors.blue),
    //               borderRadius: BorderRadius.circular(15),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 15,),
    //         TextFormField(
    //           style: const TextStyle(fontSize: 14),
    //           obscureText: _obscureText,
    //           textInputAction: TextInputAction.done,
    //           obscuringCharacter: "*",
    //           controller: passwordController,
    //           decoration: InputDecoration(
    //             hintText: 'Password',
    //             suffixIcon: IconButton(
    //               splashRadius: 5,
    //               onPressed: () {
    //                 setState(() {
    //                   if (_obscureText) {
    //                     _obscureText = false;
    //                   } else {
    //                     _obscureText = true;
    //                   }
    //                 });
    //               },
    //               icon: Icon(
    //                 _obscureText ? Icons.visibility : Icons.visibility_off_outlined,
    //                 color: _obscureText ? Colors.grey : Colors.blue,
    //               ),
    //             ),
    //             filled: true,
    //             fillColor: Colors.blueGrey[50],
    //             enabledBorder: OutlineInputBorder(
    //               borderSide: BorderSide(color: Colors.blueGrey.shade50),
    //               borderRadius: BorderRadius.circular(15),
    //             ),
    //             focusedBorder: OutlineInputBorder(
    //               borderSide: BorderSide(color: Colors.blueGrey.shade50),
    //               borderRadius: BorderRadius.circular(15),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 15,),
    //          MaterialButton(
    //            height: 50,
    //           color: Colors.lightBlue,
    //             child: const Text(
    //               'Login' ,style: TextStyle(color: Colors.white),
    //             ),
    //              onPressed: () {
    //                String userName = usernameController.text;
    //                String password = passwordController.text;
    //                print(userName);
    //                print(password);
    //                if(userName != ''  && password != '') {
    //                    String data = usernameController.text;
    //                  _saveData(data);
    //                  _loadData();
    //                  Navigator.pushReplacement(context,
    //                      MaterialPageRoute(builder: (context) =>  HomeScreen(username:userName)));
    //                }
    //              }
    //          )
    //     ],
    //   ),
    //     )
    // ),
    // );
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade800,
                  Colors.blue.shade400
                ]
            )
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80,),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Text("Login", style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.bold),),
                   SizedBox(height: 10,),
                     // Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 60,),
                       Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                            )]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                              ),
                              child:  TextFormField(
                                controller: usernameController,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                    hintText: "User Name",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                              ),
                              child:  TextFormField(
                                controller: passwordController,
                                textInputAction: TextInputAction.done,
                                obscureText: _obscureText,
                                decoration:  InputDecoration(
                                    hintText: "Password",
                                    hintStyle: const TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                    suffixIcon: IconButton(
                                                splashRadius: 5,
                                                onPressed: () {
                                                  setState(() {
                                                    if (_obscureText) {
                                                      _obscureText = false;
                                                    } else {
                                                      _obscureText = true;
                                                    }
                                                  });
                                                },
                                                icon: Icon(
                                                  _obscureText ? Icons.visibility : Icons.visibility_off_outlined,
                                                  color: _obscureText ? Colors.grey : Colors.blue,
                                                ),
                                              )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40,),
                       const Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                      const SizedBox(height: 40,),
                       MaterialButton(
                        onPressed: () {
                          String userName = usernameController.text;
                                         String password = passwordController.text;
                                         print(userName);
                                         print(password);
                                         if(userName != ''  && password != '') {
                                             String data = usernameController.text;
                                           _saveData(data);
                                           _loadData();
                                           Navigator.pushReplacement(context,
                                               MaterialPageRoute(builder: (context) =>  HomeScreen(username:userName)));
                                         }
                        },
                        height: 50,
                        // margin: EdgeInsets.symmetric(horizontal: 50),
                        color: Colors.blue[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        ),
                        // decoration: BoxDecoration(
                        // ),
                        child: const Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      // const SizedBox(height: 50,),
                      //  const Text("Continue with social media", style: TextStyle(color: Colors.grey),),
                      // const SizedBox(height: 30,),
                      // Row(
                      //   children: <Widget>[
                      //     Expanded(
                      //        child: MaterialButton(
                      //         onPressed: (){},
                      //         height: 50,
                      //         color: Colors.blue,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(50),
                      //         ),
                      //         child: const Center(
                      //           child: Text("Facebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      //         ),
                      //       )),
                      //     const SizedBox(width: 30,),
                      //     Expanded(
                      //       child: MaterialButton(
                      //         onPressed: () {},
                      //         height: 50,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(50),
                      //
                      //         ),
                      //         color: Colors.black,
                      //         child: const Center(
                      //           child: Text("Github", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      //         ),
                      //       )),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


