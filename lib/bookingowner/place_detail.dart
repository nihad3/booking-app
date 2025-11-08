import 'dart:io';

import 'package:booking_app/bookingowner/ouner_home.dart';
import 'package:booking_app/services/database.dart';
import 'package:booking_app/services/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class PlaceDetail extends StatefulWidget {
  const PlaceDetail({super.key});

  @override
  State<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  bool isChecked = false,
      isChecked1 = false,
      isChecked2 = false,
      isChecked3 = false;

      File? selectedImage;
      final ImagePicker _picker = ImagePicker();

      TextEditingController placenamecontroller= new TextEditingController();
      TextEditingController placechargescontroller= new TextEditingController();
      TextEditingController placeaddresscontroller= new TextEditingController();
      TextEditingController placedesccontroller= new TextEditingController();

    Future getImage()async{
  
      var image = await _picker.pickImage(source: ImageSource.gallery);
      selectedImage = File(image!.path);
      setState(() {
        
      });
    }



 @override
 Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.blue,
    body: Container(
      
      margin:EdgeInsets.only(top: 40.0),
      child: Column(
      children: [
      
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Place Details",style: AppWidget.boldtextstyle(26.0),)
      ],),
      SizedBox(height: 20.0,),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20),
          decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30))),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0,),
                selectedImage!=null?
                Container(
                  height: 200,
                  width: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.file(
                      selectedImage!,
                      fit: BoxFit.cover,),
                  ),

                ):
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(20) ,
                        border: Border.all(
                          width: 2.0,
                          color: Colors.black45
                          )
                          ),
                      child: Icon
                      (Icons.camera_alt,
                       color: Colors.blue,
                       size: 30,),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Text("Place Name", style: AppWidget.normaltextstyle(20.0),),
                SizedBox(height: 5.0,),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(color:  Color(0xFFececf8), borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: placenamecontroller,
                    decoration: InputDecoration(border: InputBorder.none,hintText: "Enter Place Name", hintStyle: AppWidget.normaltextstyle(18.0)),
                  ),
                ),
              
                SizedBox(height: 20.0,),
                Text("Room charges", style: AppWidget.normaltextstyle(20.0),),
                SizedBox(height: 5.0,),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(color:  Color(0xFFececf8), borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: placechargescontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Room Charges ",
                      hintStyle: AppWidget.normaltextstyle(18.0)),
                  ),
                ),
                SizedBox(height: 20.0,),
                Text("Place Address", style: AppWidget.normaltextstyle(20.0),),
                SizedBox(height: 5.0,),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(color:  Color(0xFFececf8), borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: placeaddresscontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Place Address ",
                      hintStyle: AppWidget.normaltextstyle(18.0)),
                  ),
                ),
              
                SizedBox(height: 20.0,),
                Text(
                  "What service you want to offer?",
                  style: AppWidget.normaltextstyle(20.0),
                ),
                SizedBox(height: 5.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value){
                      setState(() {
                        isChecked = value!;
                      });
                    }
                    ),
                    Icon(
                      Icons.wifi,
                      color: const Color.fromARGB(255, 16, 98, 164), 
                      size: 30.0,
                    ),
                    SizedBox(width: 10.0),
                    Text("WiFi", style: AppWidget.normaltextstyle(23.0),),
              
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isChecked1,
                      onChanged: (bool? value){
                      setState(() {
                        isChecked1 = value!;
                      });
                    }
                    ),
                    Icon(
                      Icons.tv,
                      color: const Color.fromARGB(255, 16, 98, 164), 
                      size: 30.0,
                    ),
                    SizedBox(width: 10.0),
                    Text("HDTV", style: AppWidget.normaltextstyle(23.0),),
              
                  ],
                ),
                 SizedBox(height: 5.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isChecked2,
                      onChanged: (bool? value){
                      setState(() {
                        isChecked2 = value!;
                      });
                    }
                    ),
                    Icon(
                      Icons.kitchen,
                      color: const Color.fromARGB(255, 16, 98, 164), 
                      size: 30.0,
                    ),
                    SizedBox(width: 10.0),
                    Text("Kitchen", style: AppWidget.normaltextstyle(23.0),),
              
                  ],
                ),
              
                 SizedBox(height: 5.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isChecked3,
                      onChanged: (bool? value){
                      setState(() {
                        isChecked3 = value!;
                      });
                    }
                    ),
                    Icon(
                      Icons.bathroom,
                      color: const Color.fromARGB(255, 16, 98, 164), 
                      size: 30.0,
                    ),
                    SizedBox(width: 10.0),
                    Text("Bathroom", style: AppWidget.normaltextstyle(23.0),),
              
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  "What service you want to offer?",
                  style: AppWidget.normaltextstyle(20.0),
                ),
                    
                SizedBox(height: 20.0,),
              Text("Place Description", style: AppWidget.normaltextstyle(20.0),),
              SizedBox(height: 5.0,),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(color:  Color(0xFFececf8), borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: placedesccontroller,
                  maxLines: 6,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter About Place ",
                    hintStyle: AppWidget.normaltextstyle(18.0)),
                ),
              ),       
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: ()async {
                  String addId= randomAlphaNumeric(10);

                  Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImage").child(addId);
                  // final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
//                   if (selectedImage == null) {
//   // Skip upload or show a warning (depending on what you want)
//   print("⚠️ No image selected — skipping upload for now.");
  
//   // You can still continue your registration or save text data here.
//   return; 
// }

final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

                  var downloadUrl = await(await task).ref.getDownloadURL();

                  Map<String, dynamic> addPlace ={
                    "Image": "",
                    "PlaceName": placenamecontroller.text,
                    "PlacesCharges": placechargescontroller.text,
                    "PlaceAddress": placeaddresscontroller.text,
                    "PlaceDescription":placedesccontroller.text,
                    "Wi-Fi": isChecked ? "true" : "false",
                    "HDTV": isChecked1 ? "true" : "false",
                    "Kitchen": isChecked2 ? "true" : "false",
                    "Bathroom": isChecked3 ? "true" : "false",
                    "Id": addId,

                  };
                  await DatabaseMethods().addPlaceInfo(addPlace, addId);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "Place details has been uploaded Successefully !",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          )
                          
                      ),
                    ),
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OunerHome()));
                },
                
                child: Center(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width/1.5,
                    child: Center(child: Text("Submit", style: AppWidget.boldtextstyle(26.0),)),
                  ),
                ),
              ),
              
              SizedBox(height: 20.0,),
              
                
                
                      
              ],),
            ),
        ),
      )
    ],),),
  );
 }
}