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

String email = "", password = "", name = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();

  userLogin()async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
         password: password!,);

         Navigator.push(context, MaterialPageRoute(builder: (context)=> Bottomnav()));
    } on FirebaseAuthException catch (e){
      if (e.code == 'user_not_found'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
            "No user Found for the email ", 
            style: TextStyle(fontSize: 18.0, color:Colors.black),
          ),)
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor:Colors.white ,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Image.asset("images/login.png"),
        SizedBox(height: 5.0,),
        Center(
          child: Text("LogIn", style: AppWidget.headlinetextstyle(25.0),)),
        SizedBox(height: 5.0,),
        Center(
          child: Text(
            "Please enter the details to continue ." ,
           style: AppWidget.normaltextstyle(17.0),),
        ),


              SizedBox(height: 15.0,),

        Padding(
          padding: const EdgeInsets.only(left:30.0 ),
          child: Text("Email", style:AppWidget.normaltextstyle(22.0),),
        ),
          SizedBox(height: 10.0,),
          Container(
          margin: EdgeInsets.only(left:20.0, right: 30.0),
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

              SizedBox(height: 30.0,),

        Padding(
          padding: const EdgeInsets.only(left:30.0 ),
          child: Text("Password", style:AppWidget.normaltextstyle(22.0),),
        ),
          SizedBox(height: 10.0,),
          Container(
          margin: EdgeInsets.only(left:20.0, right: 30.0),
          decoration: BoxDecoration(
          color: const Color(0xFFececf8),borderRadius: BorderRadius.circular(10.0)  ),
          child: TextField(
            controller: passwordcontroller,
            obscureText: true,
          decoration : InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.password, color: const Color.fromARGB(255, 16, 98, 164)),
            hintText:"Enter Password ",
            hintStyle: AppWidget.normaltextstyle(16.0) ),
      ),
      ),
      SizedBox(height:10.0),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Text("Forgot Password ? ", style: AppWidget.normaltextstyle(18.0))
        
        ],),
      ),
      SizedBox(height: 30.0,),
      GestureDetector(
        onTap: (){
          if(mailcontroller.text!="" && passwordcontroller.text!="" && passwordcontroller.text!=""){
            setState(() {
              email = mailcontroller.text;
              password = passwordcontroller.text;
            });
            userLogin();
          }
         

        },
        child: Center(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 19, 141, 240),
               borderRadius: BorderRadius.circular(10)),
            width:MediaQuery.of(context).size.width/2,
            child: Center(
              child: Text(
                "LogIn ",
              style:TextStyle(
                color:Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold) ),
            ),
            ), 
        ),
      ),
      SizedBox(height: 20.0,),
      Row(
        mainAxisAlignment :MainAxisAlignment.center,
        children: [ 
        
        Text("Don't have an account  ? ", style: AppWidget.normaltextstyle(18.0)),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> Signup()));
          },
          child: Text("Signup",style: AppWidget.headlinetextstyle(20.0))),
      ],)
      ],))
    );
  }
}
