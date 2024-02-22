import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  const Dashboard({super.key});

  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard>{
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
                      Text('Hello, Mohit!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'Onest'
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: (){},
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
                  'Trackers Metrices',
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
                        child: Image.asset('assets/images/appimages/heart.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
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
                        child: Image.asset('assets/images/appimages/steps.png',
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
            )
          ],
        )
      ),
    );
  }
}