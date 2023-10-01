import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tif/bloc/all_event_bloc/all_event_event.dart';
import 'package:tif/bloc/all_event_bloc/all_event_state.dart';
import 'package:tif/screens/all_events/all_event_list_view_card.dart';
import 'package:tif/screens/all_events/search_text_field.dart';

import '../../bloc/all_event_bloc/all_event_bloc.dart';
import '../../data/model/event_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AllEventBloc _allEventBloc = AllEventBloc();
  bool isSearch = false;
  @override
  void initState() {
    // TODO: implement initState
    _allEventBloc.add(GetAllEventList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.scaffoldBackgroundColor,
        elevation: 0,
        leadingWidth: 120,
        leading:   Padding(
          padding: EdgeInsets.only(top: 2.h, left: 30),
          child: Text(
           isSearch  ? "Search" :  'Events',
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Color.fromRGBO(17, 12, 38, 1),
                fontFamily: 'Inter',
                fontSize: 24,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                setState(() {
                  isSearch = !isSearch;
                });
              },
              child: Image.asset("assets/search.jpg")),
          Image.asset("assets/More.png")
        ],
      ),
      body: _buildAllEvent(),
    );
  }

  Widget _buildAllEvent() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _allEventBloc,
        child: BlocListener<AllEventBloc, AllEventState>(
          listener: (context, state) {
            if (state is AllEventsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<AllEventBloc, AllEventState>(
            builder: (context, state) {
              if (state is AllEventsInitial) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF5668FF),
                  ),
                );
              } else if (state is AllEventsLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF5668FF),
                  ),
                );
              } else if (state is AllEventsLoaded) {
                return Column(
                  children: [ 
                    isSearch ?   const SearchTextField( ) : const SizedBox(),
                    Expanded(
                        child: _allEventList(
                            context, state.eventsModel.content!.data!)),
                  ],
                );
              } else if (state is AllEventsError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
  
  Widget _allEventList(
    BuildContext context,
    List<Data> list,
  ) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return AllEventsListViewCard(
          list: list,
          idx: index,
        );
      },
    );
  }
}
