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
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();
 
 registration() async {
  if (namecontroller.text !="" &&
      mailcontroller.text !=""){
        try {
          UserCredential userCredential = await FirebaseAuth.instance.
              createUserWithEmailAndPassword(email: email, password: password);
          String id = randomAlphaNumeric(10);
          Map<String, dynamic> userInfoMap={
            "Name":namecontroller.text,
            "Email":mailcontroller.text,
            "Id": id,
            
          };
          await SharedPreferenceHelper().saveUserName(namecontroller.text);
          await SharedPreferenceHelper().saveUserEmail(mailcontroller.text);
          await SharedPreferenceHelper().saveUserId(id);

           await DatabaseMethods().addUserInfo(userInfoMap, id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  "Registered Successfully !",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>Bottomnav()));
        }on FirebaseAuthException catch (e){
          if (e.code == 'weak-password'){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text(
                  "Password Provided is too Weak",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            );
          }else if(e.code == "email-already-in-use"){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text(
                  "Account Already exists",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              
              );

          }
        }
      }
  
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        Center(
          child: Image.asset("images/signup.png",
                       height: 300,
                       width:300,
                       fit: BoxFit.cover,)),
        SizedBox(height: 5.0,),
        Center(
          child: Text("Sign Up", style: AppWidget.headlinetextstyle(25.0),)),
        SizedBox(height: 5.0,),
        Center(
          child: Text(
            "Please enter the details to continue ." ,
           style: AppWidget.normaltextstyle(17.0),),
        ),

        SizedBox(height: 20.0,),

        Padding(
          padding: const EdgeInsets.only(left:30.0 ),
          child: Text("Name", style:AppWidget.normaltextstyle(20.0),),
        ),
          SizedBox(height: 10.0,),
          Container(
          margin: EdgeInsets.only(left:30.0, right: 30.0),
          decoration: BoxDecoration(
          color: const Color(0xFFececf8),borderRadius: BorderRadius.circular(10.0)  ),
          child: TextField(
            controller: namecontroller,
          decoration : InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.person, color: const Color.fromARGB(255, 16, 98, 164)),
            hintText:"Enter Name ",
            hintStyle: AppWidget.normaltextstyle(16.0) ),
      ),
      ),

              SizedBox(height: 15.0,),

        Padding(
          padding: const EdgeInsets.only(left:30.0 ),
          child: Text("Email", style:AppWidget.normaltextstyle(20.0),),
        ),
          SizedBox(height: 10.0,),
          Container(
          margin: EdgeInsets.only(left:30.0, right: 30.0),
          decoration: BoxDecoration(
          color: const Color(0xFFececf8),borderRadius: BorderRadius.circular(10.0)  ),
          child: TextField(
            controller: mailcontroller,
          decoration : InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.mail, color: const Color.fromARGB(255, 16, 98, 164)),
            hintText:"Enter Email",
            hintStyle: AppWidget.normaltextstyle(16.0) ),
      ),
      ),

              SizedBox(height: 15.0,),

        Padding(
          padding: const EdgeInsets.only(left:30.0 ),
          child: Text("Password", style:AppWidget.normaltextstyle(20.0),),
        ),
          SizedBox(height: 10.0,),
          Container(
          margin: EdgeInsets.only(left:30.0, right: 30.0),
          decoration: BoxDecoration(
          color: const Color(0xFFececf8),borderRadius: BorderRadius.circular(10.0)  ),
          child: TextField(
            obscureText: true,
            controller: passwordcontroller,
          decoration : InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.password, color: const Color.fromARGB(255, 16, 98, 164)),
            hintText:"Enter Password ",
            hintStyle: AppWidget.normaltextstyle(16.0) ),
      ),
      ),
      SizedBox(height: 30.0,),
      GestureDetector(
        onTap: (){
          if(namecontroller.text!="" && mailcontroller.text!="" && passwordcontroller.text!=""){
            setState(() {
              email = mailcontroller.text;
              password = passwordcontroller.text;
            });
          }
          registration();

        },
        child: Center(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.green,
               borderRadius: BorderRadius.circular(10)),
            width:MediaQuery.of(context).size.width/2,
            child: Center(
              child: Text("Sign Up", style:TextStyle(color:Colors.white,fontSize: 24.0, fontWeight: FontWeight.bold) ),
            ),
            ),
        ),
      ),
      SizedBox(height: 20.0,),
      Row(
        mainAxisAlignment :MainAxisAlignment.center,
        children: [ 
        
        Text("Already have an account ? ", style: AppWidget.normaltextstyle(18.0)),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> Login()));
          },
          child: Text("LogIn",style: AppWidget.headlinetextstyle(20.0))),
      ],)



          
          ],),),
    );
  }
}