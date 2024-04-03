// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:shopify/Screens/homescreen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, this.item});
  final item;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 60.h, bottom: 30.h,left: 30.w,right: 30.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.r),
                                bottomRight: Radius.circular(30.r))),
                        height: 400.h,
                        child: Center(
                          child: Image.network(widget.item['image']),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context)=>HomeScreen())),
                              child: Container(
                                height: 50.h,
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                decoration: BoxDecoration(
                                    color: Color(0xffF2F5FF),
                                    borderRadius: BorderRadius.circular(15.r),
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 245, 245, 245))),
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: Color(0xffF2F5FF),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Color(0xffE3E6ED),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Product Detail',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 16.sp),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50.h,
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              decoration: BoxDecoration(
                                  color: Color(0xffF2F5FF),
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 245, 245, 245))),
                              child: Icon(
                                Icons.favorite_border,
                                color: Color(0xff721D24),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item['title'].toString(),
                          style: TextStyle(
                              fontSize: 21.sp,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            Text(
                               widget.item['category'].toString(),
                              style: TextStyle(
                                  color: Color(0xff010101),
                                  fontSize: 17.sp,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 3.h,
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
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: Color(0xff721D24),
                                ),
                                Text(
                                   widget.item['rating']['rate'].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                widget.item['rating']['count'].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Divider(
                          color: Color.fromARGB(255, 138, 138, 138),
                          thickness: 0.5,
                          height: 1,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        ReadMoreText(
                         widget.item['description'].toString(), 
                          trimLines: 2,
                          colorClickableText: const Color(0xff721D24),
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff721D24)),
                          style: TextStyle(
                              color: const Color.fromARGB(255, 82, 82, 82),
                              fontSize: 15.5.sp,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 15.h, bottom: 15.h),
                height: 100,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$',
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 23.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.item['price'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 35.sp,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      height: 95.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(0xff721D24)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'Buy Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
