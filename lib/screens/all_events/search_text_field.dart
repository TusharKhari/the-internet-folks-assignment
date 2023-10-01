// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart'; 

 import 'package:tif/screens/search/searched_events_screen.dart';

class SearchTextField extends StatelessWidget {
 
    const SearchTextField({
    Key? key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        onSubmitted: (value) {
         // ApiRepository().fetchSearchEvents(value);
         Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SearchedEventScreen(text: value,);
         },));
        },
        cursorColor: const Color.fromRGBO(86,105,255,  1),
        decoration: const InputDecoration(
       hintText: 'Type Event Name', 
       prefixIcon: Icon(Icons.search, color:  Color.fromRGBO(86,105,255,  1),)
       , border: InputBorder.none
  ),
      ),
    );
  }
}
