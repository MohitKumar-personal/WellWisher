import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget{
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>{

  // Sign Out User Method
  void signOutUser(){
    FirebaseAuth.instance.signOut();
  }

  //GET USER DETAILS
  final User? currentUser = FirebaseAuth.instance.currentUser;
  Future<DocumentSnapshot<Map<String,dynamic>>> getUserInfo() async{
    return await FirebaseFirestore.instance
        .collection('UsersData')
        .doc(currentUser!.email)
        .get();
  }

  // Show Error Messages
  void showErrorMessage(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(message,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )
          ),
        ),
        backgroundColor: const Color(0xffd30001),
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 120,
            left: 25,
            right: 25
        ),
      ),
    );
  }

  final ref = FirebaseDatabase.instance.ref('Values');

  Widget build(BuildContext){
    return Scaffold(
      backgroundColor: const Color(0xfff5fffa),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 25,
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){},
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/images/profile/dp.jpg'),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text('Hello, ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Onest'
                          ),
                        ),
                        FutureBuilder(
                            future: getUserInfo(),
                            builder: (context, snapshot){
                              if (snapshot.hasData){
                                Map<String,dynamic>?user = snapshot.data!.data();
                                return Text(
                                  user!['fullname'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: 'Onest'
                                  ),
                                );
                              }
                              else if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Text("Loading...");
                              }
                              else if (snapshot.hasError){
                                return Text("Error: ${snapshot.error}");
                              }
                              else {
                                return const Text("No Data");
                              }
                            },
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        signOutUser();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffede7e3),
                        ),
                        child: Icon(
                          Icons.logout,
                          size: 25,
                          // color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                  'Tracker Metrices',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Onest'
                  ),

                ),
              ),
              // ---------------------------Heart Beat-----------------------
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 25,
                ),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Color(0xff82c0cc),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Expanded(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 25,
                              ),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text('82',
                                          style: TextStyle(
                                              fontSize: 50,
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Onest'
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                        child: Text('bpm',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Onest'
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text('HEART',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'Onest',
                                  fontWeight: FontWeight.w700
                              ),),
                            Text('BEAT',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'Onest',
                                  fontWeight: FontWeight.w700
                              ),),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            height: 250,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(30.0),
                              // border: Border.all(),
                            ),
                            child: Image.asset('assets/images/illustrationart/heart.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //-----------------Steps taken -------------------------------
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  // vertical: 25,
                ),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Color(0xffffdca7),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
                          child: Container(
                            height: 250,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(30.0),
                              // border: Border.all(),
                            ),
                            child: Image.asset('assets/images/illustrationart/steps.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,top: 20, bottom: 10, right: 20),
                              child: Text('STEPS',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontFamily: 'Onest',
                                    fontWeight: FontWeight.w700
                                ),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20,right: 20),
                              child: Text('TAKEN',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontFamily: 'Onest',
                                    fontWeight: FontWeight.w700
                                ),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10,
                              ),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text('2932',
                                          style: TextStyle(
                                              fontSize: 50,
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Onest'
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}