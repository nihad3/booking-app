// import 'package:booking_app/pages/bottomnav.dart';
// import 'package:booking_app/pages/login.dart';
// import 'package:booking_app/services/database.dart';
// import 'package:booking_app/services/shared_perference.dart';
// import 'package:booking_app/services/widget_support.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:random_string/random_string.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {

//   String email = "", password = "", name = "";
//   TextEditingController namecontroller = new TextEditingController();
//   TextEditingController passwordcontroller = new TextEditingController();
//   TextEditingController mailcontroller = new TextEditingController();
 
//  registration() async {
//   if (password != null &&
//       namecontroller.text !="" &&
//       mailcontroller.text !=""){
//         try {
//           UserCredential userCredential = await FirebaseAuth.instance.
//               createUserWithEmailAndPassword(email: email, password: password);
//           String id = randomAlphaNumeric(10);
//           Map<String, dynamic> userInfoMap={
//             "Name":namecontroller.text,
//             "Email":mailcontroller.text,
//             "Id": id,
            
//           };
//           await SharedPreferenceHelper().saveUserName(namecontroller.text);
//           await SharedPreferenceHelper().saveUserEmail(mailcontroller.text);
//           await SharedPreferenceHelper().saveUserId(id);

//            await DatabaseMethods().addUserInfo(userInfoMap, id);
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 backgroundColor: Colors.green,
//                 content: Text(
//                   "Registered Successfully !",
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ),
//             );
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context)=>Bottomnav()));
//         }on FirebaseAuthException catch (e){
//           if (e.code == 'weak-password'){
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 backgroundColor: Colors.orangeAccent,
//                 content: Text(
//                   "Password Provided is too Weak",
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ),
//             );
//           }else if(e.code == "email-already-in-use"){
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 backgroundColor: Colors.orangeAccent,
//                 content: Text(
//                   "Account Already exists",
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ),
              
//               );

//           }
//         }
//       }
  
//  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body:Container(
//         child: SingleChildScrollView(
//           child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children:[
//           Center(
//             child: Image.asset("images/signup.png",
//                          height: 300,
//                          width:300,
//                          fit: BoxFit.cover,)),
//           SizedBox(height: 5.0,),
//           Center(
//             child: Text("Sign Up", style: AppWidget.headlinetextstyle(25.0),)),
//           SizedBox(height: 5.0,),
//           Center(
//             child: Text(
//               "Please enter the details to continue ." ,
//              style: AppWidget.normaltextstyle(17.0),),
//           ),
          
//           SizedBox(height: 20.0,),
          
//           Padding(
//             padding: const EdgeInsets.only(left:30.0 ),
//             child: Text("Name", style:AppWidget.normaltextstyle(20.0),),
//           ),
//             SizedBox(height: 10.0,),
//             Container(
//             margin: EdgeInsets.only(left:30.0, right: 30.0),
//             decoration: BoxDecoration(
//             color: const Color(0xFFececf8),borderRadius: BorderRadius.circular(10.0)  ),
//             child: TextField(
//               controller: namecontroller,
//             decoration : InputDecoration(
//               border: InputBorder.none,
//               prefixIcon: Icon(Icons.person, color: const Color.fromARGB(255, 16, 98, 164)),
//               hintText:"Enter Name ",
//               hintStyle: AppWidget.normaltextstyle(16.0) ),
//                 ),
//                 ),
          
//                 SizedBox(height: 15.0,),
          
//           Padding(
//             padding: const EdgeInsets.only(left:30.0 ),
//             child: Text("Email", style:AppWidget.normaltextstyle(20.0),),
//           ),
//             SizedBox(height: 10.0,),
//             Container(
//             margin: EdgeInsets.only(left:30.0, right: 30.0),
//             decoration: BoxDecoration(
//             color: const Color(0xFFececf8),borderRadius: BorderRadius.circular(10.0)  ),
//             child: TextField(
//               controller: mailcontroller,
//             decoration : InputDecoration(
//               border: InputBorder.none,
//               prefixIcon: Icon(Icons.mail, color: const Color.fromARGB(255, 16, 98, 164)),
//               hintText:"Enter Email",
//               hintStyle: AppWidget.normaltextstyle(16.0) ),
//                 ),
//                 ),
          
//                 SizedBox(height: 15.0,),
          
//           Padding(
//             padding: const EdgeInsets.only(left:30.0 ),
//             child: Text("Password", style:AppWidget.normaltextstyle(20.0),),
//           ),
//             SizedBox(height: 10.0,),
//             Container(
//             margin: EdgeInsets.only(left:30.0, right: 30.0),
//             decoration: BoxDecoration(
//             color: const Color(0xFFececf8),borderRadius: BorderRadius.circular(10.0)  ),
//             child: TextField(
//               obscureText: true,
//               controller: passwordcontroller,
//             decoration : InputDecoration(
//               border: InputBorder.none,
//               prefixIcon: Icon(Icons.password, color: const Color.fromARGB(255, 16, 98, 164)),
//               hintText:"Enter Password ",
//               hintStyle: AppWidget.normaltextstyle(16.0) ),
//                 ),
//                 ),
//                 SizedBox(height: 30.0,),
//                 GestureDetector(
//           onTap: (){
//             if(namecontroller.text!="" 
//             && mailcontroller.text!="" 
//             && passwordcontroller.text!=""){
//               setState(() {
//                 email = mailcontroller.text;
//                 password = passwordcontroller.text;
//               });
//             }
//             registration();
          
//           },
//           child: Center(
//             child: Container(
//               height: 60,
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                  borderRadius: BorderRadius.circular(10)),
//               width:MediaQuery.of(context).size.width/2,
//               child: Center(
//                 child: Text("Sign Up", style:TextStyle(color:Colors.white,fontSize: 24.0, fontWeight: FontWeight.bold) ),
//               ),
//               ),
//           ),
//                 ),
//                 SizedBox(height: 20.0,),
//                 Row(
//           mainAxisAlignment :MainAxisAlignment.center,
//           children: [ 
          
//           Text("Already have an account ? ", style: AppWidget.normaltextstyle(18.0)),
//           GestureDetector(
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder:(context)=> Login()));
//             },
//             child: Text("LogIn",style: AppWidget.headlinetextstyle(20.0))),
//                 ],)
          
          
          
            
//             ],),
//         ),),
//     );
//   }
// }














import 'package:booking_app/pages/bottomnav.dart';
import 'package:booking_app/pages/login.dart';
import 'package:booking_app/services/database.dart';
import 'package:booking_app/services/shared_perference.dart';
import 'package:booking_app/services/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = "", password = "", name = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;
  bool acceptTerms = false;

  registration() async {
    if (passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        mailController.text.isNotEmpty) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: mailController.text,
          password: passwordController.text,
        );

        String id = randomAlphaNumeric(10);
        Map<String, dynamic> userInfoMap = {
          "Name": nameController.text,
          "Email": mailController.text,
          "Phone": phoneController.text,
          "Id": id,
        };

        await SharedPreferenceHelper().saveUserName(nameController.text);
        await SharedPreferenceHelper().saveUserEmail(mailController.text);
        await SharedPreferenceHelper().saveUserId(id);
        await DatabaseMethods().addUserInfo(userInfoMap, id);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered Successfully!",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Bottomnav()),
        );
      } on FirebaseAuthException catch (e) {
        String message = "";
        if (e.code == 'weak-password') {
          message = "Password provided is too weak";
        } else if (e.code == 'email-already-in-use') {
          message = "Account already exists";
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Please fill all fields",
            style: TextStyle(fontSize: 18.0),
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
                    "Créer un compte",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Rejoignez choufDAR aujourd'hui",
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
                  // Name Field
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Nom complet",
                      prefixIcon: const Icon(Icons.person, color: Colors.blue),
                      filled: true,
                      fillColor: const Color(0xFFececf8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

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

                  // Phone Field
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "Numéro de téléphone",
                      prefixIcon: const Icon(Icons.phone, color: Colors.blue),
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
                          showPassword ? Icons.visibility_off : Icons.visibility,
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

                  // Terms Checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: acceptTerms,
                        onChanged: (val) {
                          setState(() {
                            acceptTerms = val ?? false;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: "J'accepte les ",
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "conditions d'utilisation",
                                style: const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                              ),
                              const TextSpan(text: " et la "),
                              TextSpan(
                                text: "politique de confidentialité",
                                style: const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Sign Up Button
                  GestureDetector(
                    onTap: () {
                      if (!acceptTerms) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.orangeAccent,
                            content: Text(
                              "Vous devez accepter les conditions d'utilisation",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                        return;
                      }
                      registration();
                    },
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E3C72),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Créer mon compte",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Login link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Vous avez déjà un compte? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                        child: const Text(
                          "Se connecter",
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
