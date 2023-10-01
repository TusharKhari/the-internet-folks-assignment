// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tif/bloc/searched_event_bloc.dart/searched_event_bloc.dart';
import 'package:tif/bloc/searched_event_bloc.dart/searched_event_event.dart';
import 'package:tif/bloc/searched_event_bloc.dart/searched_event_state.dart';
import 'package:tif/screens/search/searched_events_list_view_card.dart';

class SearchedEventScreen extends StatelessWidget {
  String text;
  SearchedEventScreen({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchedEventBloc searchedEventBloc = SearchedEventBloc(text);
    searchedEventBloc.add(GetSearchedEventList());
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeData.scaffoldBackgroundColor,
          elevation: 0,
          leadingWidth: 220,
          leading: Padding(
            padding: const EdgeInsets.only(top: 12, left: 30),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                //Spacer(),
                const SizedBox(
                  width: 9,
                ),
                Text(
                  text,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Color.fromRGBO(17, 12, 38, 1),
                      fontFamily: 'Inter',
                      fontSize: 24,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ],
            ),
          ),
        ),
        body:
            // _buildSearchedEvent(),
            BlocProvider(
          create: (context) => searchedEventBloc,
          child: _buildSearchedEvent(),
        ));
  }

  Widget _buildSearchedEvent() {
    return BlocConsumer<SearchedEventBloc, SearchedEventState>(
      listener: (context, state) {
        if (state is SearchedEventError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.msg!),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is SearchedEventsInitial) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF5668FF)
            ),
          );
        } else if (state is SearchedEventLoading) {
          return const Center(child: CircularProgressIndicator(color: Color(0xFF5668FF),));
        } else if (state is SearchedEventIsEmpty) {
          return const Center(
            child: Text("No data found"),
          );
        } else if (state is SearchedEventLoaded) {
          return
              //  Text(state.searchedEventModel.content!.data![0].id.toString());
              ListView.builder(
            itemCount: state.searchedEventModel.content!.data!.length,
            itemBuilder: (context, index) {
              return SearchedEventsListViewCard(
                  list: state.searchedEventModel.content!.data!, idx: index);
            },
          );
        }
       else {
          return Container(
          height: 70,
          color: Colors.red,
        );
        }
      },
    );
  }
}
