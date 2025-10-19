import 'package:booking_app/services/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{

  const Home ({super.key});

  @override
  State<Home> createState()=> _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 242, 242),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:BorderRadius.only( 
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)) ,
                  
                             child:  Image.asset(
                    "images/home.jpg",
                     width:MediaQuery.of(context).size.width,
                     height: 280,
                     fit:BoxFit.cover,
                     ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40.0, left: 20.0),
                     width:MediaQuery.of(context).size.width,
                     height: 280,   
                     decoration: BoxDecoration(color: Colors.black45, borderRadius:BorderRadius.only( 
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)) ,), 
        
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.white,),
                          SizedBox(width: 10.0),
                          Text("India, Delhi", style: AppWidget.whitetextstyle(20.0),)
                        ],
                      ),
                      SizedBox(height: 30.0, ),
                      Text("Hey,  Shivam! Tell us where you want to go ?", style:AppWidget.whitetextstyle(22.0)),
                       SizedBox(height: 30.0, ),
                      Container(
                        padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                        margin: EdgeInsets.only(right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: const Color.fromARGB(104, 255, 255, 255),
                         borderRadius:BorderRadius.circular(30) ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,prefixIcon: Icon(Icons.search, color: Colors.white,),hintText: "Search Places....", hintStyle: AppWidget.whitetextstyle(20.0)
                          ),
                        ),
        
                      )
        
                    ],
                  ),             
        
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: Text("The most relevent",style: AppWidget.headlinetextstyle(22.0)),
              ),
              SizedBox(height: 20.0,),
              Container(
                height: 330,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin:EdgeInsets.only(left:20.0,bottom: 5.0),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(30.0) ,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30.0) ),
                  
                          child: Column(
                            children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "images/hotel1.jpg",
                                 width: MediaQuery.of(context).size.width/1.2,),
                            ),
                            SizedBox(height:10.0,),
                            Padding(
                              padding: const EdgeInsets.only(left:10.0 ),
                              child: Row(
                                children: [
                                  Text("Hotel Beach",style:AppWidget.headlinetextstyle(22.0)),
                                  SizedBox(width: MediaQuery.of(context).size.width/3.5,),
                                  Text("\$20", style: AppWidget.headlinetextstyle(25.0))
                                ],
                              ),
                            ),
                            SizedBox(width:5.0,),
                            Padding(
                              padding: const EdgeInsets.only(left:10.0 ),
                              child: Row(children: [
                                Icon(Icons.location_on,color: Colors.blue,size:30.0),
                                SizedBox(width:5.0,),
                                Text("Near Main Market, Delhi", style: AppWidget.normaltextstyle(18.0))
                              ],),
                            )
                          ],),
                        ),
                      ),
                    ),
        
        
                    Container(
                      margin:EdgeInsets.only(left:20.0,bottom: 5.0),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(30.0) ,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30.0) ),
                  
                          child: Column(
                            children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "images/hotel2.jpg",
                                 width: MediaQuery.of(context).size.width/1.2, fit: BoxFit.cover,height: 230,),
                            ),
                            SizedBox(height:10.0,),
                            Padding(
                              padding: const EdgeInsets.only(left:10.0 ),
                              child: Row(
                                children: [
                                  Text("Hotel Beach",style:AppWidget.headlinetextstyle(22.0)),
                                  SizedBox(width: MediaQuery.of(context).size.width/3.5,),
                                  Text("\$20", style: AppWidget.headlinetextstyle(25.0))
                                ],
                              ),
                            ),
                            SizedBox(width:5.0,),
                            Padding(
                              padding: const EdgeInsets.only(left:10.0 ),
                              child: Row(children: [
                                Icon(Icons.location_on,color: Colors.blue,size:30.0),
                                SizedBox(width:5.0,),
                                Text("Near Main Market, Delhi", style: AppWidget.normaltextstyle(18.0))
                              ],),
                            )
                          ],),
                        ),
                      ),
                    ),
        
        
        
        
                     Container(
                      margin:EdgeInsets.only(left:20.0,bottom: 5.0),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(30.0) ,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30.0) ),
                  
                          child: Column(
                            children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "images/hotel3.jpg",
                                 width: MediaQuery.of(context).size.width/1.2, fit: BoxFit.cover,height: 230,),
                            ),
                            SizedBox(height:10.0,),
                            Padding(
                              padding: const EdgeInsets.only(left:10.0 ),
                              child: Row(
                                children: [
                                  Text("Hotel Beach",style:AppWidget.headlinetextstyle(22.0)),
                                  SizedBox(width: MediaQuery.of(context).size.width/3.5,),
                                  Text("\$20", style: AppWidget.headlinetextstyle(25.0))
                                ],
                              ),
                            ),
                            SizedBox(width:5.0,),
                            Padding(
                              padding: const EdgeInsets.only(left:20.0 ),
                              child: Row(children: [
                                Icon(Icons.location_on,color: Colors.blue,size:30.0),
                                SizedBox(width:5.0,),
                                Text("Near Main Market, Delhi", style: AppWidget.normaltextstyle(18.0))
                              ],),
                            )
                          ],
                          ),
                        ),
                      ),
                    )
                
                  ],
                ),
              ),
              SizedBox(height:20.0),
              Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: Text("Discover new places",
                 style: AppWidget.headlinetextstyle(22.0)
                 ),
              ),
              SizedBox(height: 20.0,),



              Container(
                margin: EdgeInsets.only(left: 20.0, bottom: 5.0),
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 180,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/mumbai.jpg",
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text("Mumbai", style: AppWidget.headlinetextstyle(20.0)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.hotel, color: Colors.blue),
                                    SizedBox(width: 5.0),
                                    Text("10 Hotels", style: AppWidget.normaltextstyle(17.0)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                                        ),
                    ),

                 Container(
                   margin: EdgeInsets.only(left: 20.0, bottom: 5.0),
                   child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 180,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/dubai.jpg",
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text("Dubai", style: AppWidget.headlinetextstyle(20.0)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.hotel, color: Colors.blue),
                                    SizedBox(width: 5.0),
                                    Text("10 Hotels", style: AppWidget.normaltextstyle(17.0)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                 ),


                 Container(
                   margin: EdgeInsets.only(left: 20.0, bottom: 5.0),
                   child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 180,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/newyork.jpg",
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text("New York", style: AppWidget.headlinetextstyle(20.0)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.hotel, color: Colors.blue),
                                    SizedBox(width: 5.0),
                                    Text("20 Hotels", style: AppWidget.normaltextstyle(17.0)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                 ),

                 Container(
                   margin: EdgeInsets.only(left: 20.0, bottom: 5.0),
                   child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 180,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/bali.jpg",
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text("Bali", style: AppWidget.headlinetextstyle(20.0)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.hotel, color: Colors.blue),
                                    SizedBox(width: 5.0),
                                    Text("7 Hotels", style: AppWidget.normaltextstyle(17.0)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                 ),


                 

                ],),
               ),



               SizedBox(height: 50.0,)


              
        
              
        ],
        ),
        ),
      ),
    );

  }
}