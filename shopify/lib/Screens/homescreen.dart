// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shopify/Screens/resultscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<dynamic> bodydata;
  Future hitapi() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      setState(() {
        bodydata = jsonDecode(response.body);
        print(bodydata);
        isloadingData = false;
      });
    }
  }

  @override
  void initState() {
    hitapi();
    super.initState();
  }

  bool isloadingData = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isloadingData
          ? Center(
              child: CircularProgressIndicator(
                color: const Color(0xff721D24),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.only(left: 13.w, right: 13.w, top: 40.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.w,
                                child: Image.asset(
                                  fit: BoxFit.contain,
                                  'lib/Images/avatarmen.png',
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Hello',
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Icon(
                                        Icons.waving_hand,
                                        color: Color(0xffEAB34C),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Jay Rajput',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        color: Color(0xff010101),
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 60.h,
                            padding: EdgeInsets.symmetric(horizontal: 17.w),
                            decoration: BoxDecoration(
                                color: Color(0xffF2F5FF),
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                    color: Color.fromARGB(255, 245, 245, 245))),
                            child: Icon(
                              Icons.notifications_active_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 10.w),
                              height: 60.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Color(0xffF2F5FF),
                              ),
                              child: Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.search_sharp,
                                        color: const Color.fromARGB(
                                            255, 86, 86, 86),
                                      ),
                                      hintText: 'Search...',
                                      hintStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 86, 86, 86),
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 14.sp)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Container(
                            height: 60.h,
                            padding: EdgeInsets.symmetric(horizontal: 17.w),
                            decoration: BoxDecoration(
                                color: Color(0xffF2F5FF),
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                    color: Color.fromARGB(255, 245, 245, 245))),
                            child: Icon(
                              Icons.filter_list,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset('lib/Images/banner_3.jpg')),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Catergories',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 8.w,
                                  top: 5.h,
                                  bottom: 5.h,
                                  right: 17.w),
                              decoration: BoxDecoration(
                                  color: Color(0xff721D24),
                                  borderRadius: BorderRadius.circular(10.r)),
                              height: 62.h,
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    height: 50.h,
                                    child: Image.asset(
                                        fit: BoxFit.contain,
                                        'lib/Images/all.png'),
                                  ),
                                  SizedBox(
                                    width: 9.w,
                                  ),
                                  Text(
                                    'All',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 8.w,
                                  top: 5.h,
                                  bottom: 5.h,
                                  right: 17.w),
                              decoration: BoxDecoration(
                                  color: Color(0xffF2F5FF),
                                  borderRadius: BorderRadius.circular(10.r)),
                              height: 62.h,
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    height: 50.h,
                                    child: Image.asset(
                                        fit: BoxFit.contain,
                                        'lib/Images/men.png'),
                                  ),
                                  SizedBox(
                                    width: 9.w,
                                  ),
                                  Text(
                                    'Men',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 8.w,
                                  top: 5.h,
                                  bottom: 5.h,
                                  right: 17.w),
                              decoration: BoxDecoration(
                                  color: Color(0xffF2F5FF),
                                  borderRadius: BorderRadius.circular(10.r)),
                              height: 62.h,
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    height: 50.h,
                                    child: Image.asset(
                                        fit: BoxFit.contain,
                                        'lib/Images/women.png'),
                                  ),
                                  SizedBox(
                                    width: 9.w,
                                  ),
                                  Text(
                                    'Women',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 8.w,
                                  top: 5.h,
                                  bottom: 5.h,
                                  right: 17.w),
                              decoration: BoxDecoration(
                                  color: Color(0xffF2F5FF),
                                  borderRadius: BorderRadius.circular(10.r)),
                              height: 62.h,
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    height: 50.h,
                                    child: Image.asset(
                                        fit: BoxFit.contain,
                                        'lib/Images/kids.png'),
                                  ),
                                  SizedBox(
                                    width: 9.w,
                                  ),
                                  Text(
                                    'Kids',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Propular Product',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                                color: Color(0xffA23B21),
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Column(
                        children: [
                          GridView.builder(
                            itemCount: bodydata.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 14,
                                    crossAxisSpacing: 18,
                                    mainAxisExtent: 250),
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResultScreen(item: bodydata[index],))),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150.h,
                                        width: 280.w,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          child: Image.network(
                                              fit: BoxFit.contain,
                                              bodydata[index]['image']
                                                  .toString()),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        bodydata[index]['title'],
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily:
                                                GoogleFonts.poppins().fontFamily,
                                            fontSize: 17.sp),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            bodydata[index]['category']
                                                .toString(),
                                            style: TextStyle(
                                                color: Color(0xff010101),
                                                fontSize: 14.sp,
                                                fontFamily: GoogleFonts.poppins()
                                                    .fontFamily,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Icon(
                                            Icons.verified,
                                            size: 20.h,
                                            color: Color(0xff2E6DAB),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star_rounded,
                                                color: Color(0xff721D24),
                                              ),
                                              Text(
                                                bodydata[index]['rating']['rate']
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              Text(
                                                bodydata[index]['rating']['count']
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '\$' +
                                                bodydata[index]['price']
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: GoogleFonts.poppins()
                                                    .fontFamily,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
