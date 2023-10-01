// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'package:tif/data/model/event_model.dart';

class AllEventDetailScreen extends StatelessWidget {
  Data data;
  AllEventDetailScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String inputDateTimeString = data.dateTime!;
    DateTime dateTime = DateTime.parse(inputDateTimeString);
    final formattedDate = DateFormat('EEEE');
    String formattedDateTime = formattedDate.format(dateTime);
    String formattedTimeRange =
        '${DateFormat('hh:mma').format(dateTime)} - ${DateFormat('hh:mma').format(dateTime.add(const Duration(hours: 5)))}'; // Adding 5 hours to get the end time
    String result = '$formattedDateTime, $formattedTimeRange';
    String ddMMYY = DateFormat("dd MMMM, yyyy").format(dateTime);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  data.bannerImage!,
                  height: 40.h,
                  fit: BoxFit.fill,
                  width: 100.w,
                ),
                SafeArea(
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          )),
                      const Text(
                        '   Event Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      //  Image.asset("assets/Fav icon.png"),
                      const Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 5.w),
                        width: 36,
                        height: 36,
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.30000001192092896),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child:
                            Center(child: Image.asset("assets/bookmark.png")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 1.h),
              child: Text(
                data.title!,
                style: const TextStyle(
                  color: Color(0xFF110C26),
                  fontSize: 35,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            // title date location
            SizedBox(
              height: 2.h,
            ),
            _titleDateLocationWidget(
                imagePath: "assets/TIF Icon 1.png",
                title: data.title!,
                subtitle: "Organizer"),
            _titleDateLocationWidget(
                imagePath: "assets/date.png", title: ddMMYY, subtitle: result),
            _titleDateLocationWidget(
                imagePath: "assets/location.png",
                title: data.venueName!,
                subtitle: "${data.venueCity}, ${data.venueCountry}"),
            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 5.h),
              child: const Text(
                'About Event',
                style: TextStyle(
                  color: Color(0xFF110C26),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h, right: 5.w, left: 5.w),
              child: Text(
                data.description!,
                style: const TextStyle(
                  color: Color(0xFF110C26),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  //  height: 0.11,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 1.h),
        height: 9.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300]!,
                offset: const Offset(
                  -5.0,
                  -5.0,
                ),
                blurRadius: 30.0,
                spreadRadius: 15.0,
              ),
            ],
            color: const Color.fromRGBO(86,105,255,  1),
            borderRadius: BorderRadius.circular(30)),
        child:   Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            const Text(
              'BOOK NOW',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500, 
                letterSpacing: 1,
              ),
            ), 
            Image.asset("assets/book_now_arrow.png"), 
          ],
        ),
      ),
    );
  }

  Widget _titleDateLocationWidget({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: ListTile(
        leading: Image.asset(imagePath),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF0D0C26),
            fontSize: 15,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0.11,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF6F6D8F),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ),
    );
  }
}
