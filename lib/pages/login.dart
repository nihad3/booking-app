// import 'package:booking_app/pages/bottomnav.dart';
// import 'package:booking_app/pages/signup.dart';
// import 'package:booking_app/services/widget_support.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }


// class _LoginState extends State<Login> { 

// String email = "", password = "", name = "";
//   TextEditingController namecontroller = new TextEditingController();
//   TextEditingController passwordcontroller = new TextEditingController();
//   TextEditingController mailcontroller = new TextEditingController();

//   userLogin()async {
//     try{
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email!,
//          password: password!,);

//          Navigator.push(context, MaterialPageRoute(builder: (context)=> Bottomnav()));
//     } on FirebaseAuthException catch (e){
//       if (e.code == 'user_not_found'){
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(
//             "No user Found for the email ", 
//             style: TextStyle(fontSize: 18.0, color:Colors.black),
//           ),)
//         );
        
//       }else if(e.code=='wrong-password'){
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//             "Wrong Password Provided by User",
//             style: TextStyle(fontSize: 18.0,color: Colors.black),
//           ),),
//         );
//       }
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       backgroundColor:Colors.white ,
//       body: Container( 
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//           Image.asset("images/login.png"),
//           SizedBox(height: 5.0,),
//           Center(
//             child: Text("LogIn", style: AppWidget.headlinetextstyle(25.0),)),
//           SizedBox(height: 5.0,),
//           Center(
//             child: Text(
//               "Please enter the details to continue ." ,
//              style: AppWidget.normaltextstyle(17.0),),
//           ),
          
          
//                 SizedBox(height: 15.0,),
          
//           Padding(
//             padding: const EdgeInsets.only(left:30.0 ),
//             child: Text("Email", style:AppWidget.normaltextstyle(22.0),),
//           ),
//             SizedBox(height: 10.0,),
//             Container(
//                 margin: EdgeInsets.only(left:20.0, right: 30.0),
//                 decoration: BoxDecoration(
//                 color: const Color(0xFFececf8),
//                 borderRadius: BorderRadius.circular(10.0)  ),
//             child: TextField(
//                   controller: mailcontroller,
//                   decoration : InputDecoration(
//                     border: InputBorder.none,
//                     prefixIcon: Icon(Icons.mail, color: const Color.fromARGB(255, 16, 98, 164)),
//                     hintText:"Enter Email",
//                     hintStyle: AppWidget.normaltextstyle(16.0) ),
//               ),
//               ),
          
//                 SizedBox(height: 30.0,),
          
//           Padding(
//             padding: const EdgeInsets.only(left:30.0 ),
//             child: Text("Password", style:AppWidget.normaltextstyle(22.0),),
//           ),
//             SizedBox(height: 10.0,),
//             Container(
//             margin: EdgeInsets.only(left:20.0, right: 30.0),
//             decoration: BoxDecoration(
//             color: const Color(0xFFececf8),borderRadius: BorderRadius.circular(10.0)  ),
//             child: TextField(
//               controller: passwordcontroller,
//               obscureText: true,
//             decoration : InputDecoration(
//               border: InputBorder.none,
//               prefixIcon: Icon(Icons.password, color: const Color.fromARGB(255, 16, 98, 164)),
//               hintText:"Enter Password ",
//               hintStyle: AppWidget.normaltextstyle(16.0) ),
//                 ),
//                 ),
//                 SizedBox(height:10.0),
//                 Padding(
//           padding: const EdgeInsets.only(right: 20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//             Text("Forgot Password ? ", style: AppWidget.normaltextstyle(18.0))
          
//           ],),
//                 ),
//                 SizedBox(height: 30.0,),
//                 GestureDetector(
//           onTap: (){
//             if(mailcontroller.text!="" && passwordcontroller.text!="" && passwordcontroller.text!=""){
//               setState(() {
//                 email = mailcontroller.text;
//                 password = passwordcontroller.text;
//               });
//               userLogin();
//             }
           
          
//           },
//           child: Center(
//             child: Container(
//               height: 60,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 19, 141, 240),
//                  borderRadius: BorderRadius.circular(10)),
//               width:MediaQuery.of(context).size.width/2,
//               child: Center(
//                 child: Text(
//                   "LogIn ",
//                 style:TextStyle(
//                   color:Colors.white,
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold) ),
//               ),
//               ), 
//           ),
//                 ),
//                 SizedBox(height: 20.0,),
//                 Row(
//           mainAxisAlignment :MainAxisAlignment.center,
//           children: [ 
          
//           Text("Don't have an account  ? ", style: AppWidget.normaltextstyle(18.0)),
//           GestureDetector(
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder:(context)=> Signup()));
//             },
//             child: Text("Signup",style: AppWidget.headlinetextstyle(20.0))),
//                 ],)
//                 ],),
//         ))
//     );
//   }
// }


import 'package:booking_app/pages/bottomnav.dart';
import 'package:booking_app/pages/signup.dart';
import 'package:booking_app/services/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mailController.text,
        password: passwordController.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Bottomnav()),
      );
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'user-not-found') {
        message = "No user found for this email";
      } else if (e.code == 'wrong-password') {
        message = "Wrong password provided";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            message,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gradient header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 40),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Se connecter",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Veuillez entrer vos identifiants pour continuer",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // Email Field
                  TextField(
                    controller: mailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.mail, color: Colors.blue),
                      filled: true,
                      fillColor: const Color(0xFFececf8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextField(
                    controller: passwordController,
                    obscureText: !showPassword,
                    decoration: InputDecoration(
                      hintText: "Mot de passe",
                      prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                      suffixIcon: IconButton(
                        icon: Icon(
                          showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: const Color(0xFFececf8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Forgot password link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Mot de passe oublié?",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Login Button
                  GestureDetector(
                    onTap: userLogin,
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E3C72),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Se connecter",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Signup link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Vous n'avez pas de compte? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()),
                          );
                        },
                        child: const Text(
                          "Créer un compte",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
