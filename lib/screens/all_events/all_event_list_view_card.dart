// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:tif/screens/all_events/all_event_detail_screen.dart';

import '../../data/model/event_model.dart';

class AllEventsListViewCard extends StatelessWidget {
  List<Data> list;
  int idx;
  AllEventsListViewCard({
    Key? key,
    required this.list,
    required this.idx,
  }) : super(key: key);
   
  @override
  Widget build(BuildContext context) {

      String inputDateTimeString = list[idx].dateTime!;
    DateTime inputDateTime = DateTime.parse(inputDateTimeString);
    final outputFormat = DateFormat('E, MMM d • h:mm a');
    String formattedDateTime = outputFormat.format(inputDateTime);
  //  print(formattedDateTime);
    return InkWell(
      onTap: (){
       // print("object");
        Navigator.push(context, MaterialPageRoute(builder: (context) => AllEventDetailScreen(data: list[idx]),));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 327,
          height: 106,
        // height: 13.5.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(87, 92, 138, 0.05999999865889549),
                  offset: Offset(0, 10),
                  blurRadius: 35)
            ],
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Row(
            children: [
              // Text(list[0].id.toString()),
              Padding(
                padding:   EdgeInsets.symmetric(horizontal: 1.7.w, vertical: 1.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    list[idx].bannerImage!,
                    fit: BoxFit.fitHeight,
                    width: 80,
                    height: 400,
                  ),
                ),
              ),
            //  SizedBox(width: 1.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   // list[idx].dateTime!,
                   formattedDateTime,
                    style: const TextStyle(
                      color: Color(0xFF5668FF),
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      list[idx].description!,
                      maxLines: 3,
                      style: const TextStyle(
                        color: Color(0xFF110C26),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                    Image.asset("assets/map-pin.png"),
                     /// Icon(Icons.location_on, size: 12,color: Color(0xFF747688),),
                      Text(
                        // '53 Bush St • San Francisco, CA ',
                         "  ${list[idx].venueCity} • ${list[idx].venueCountry}",
                        style: const TextStyle(
                          color: Color(0xFF747688),
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
