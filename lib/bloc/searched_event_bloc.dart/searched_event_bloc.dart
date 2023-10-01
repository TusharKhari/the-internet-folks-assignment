// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tif/bloc/searched_event_bloc.dart/searched_event_event.dart';
import 'package:tif/bloc/searched_event_bloc.dart/searched_event_state.dart';

import '../../Repo/api_repo.dart';

class SearchedEventBloc extends Bloc<SearchedEventEvent,SearchedEventState > {
  String  q;
  SearchedEventBloc(
     this.q, 
  ) : super(SearchedEventsInitial(),)   {
    
    final ApiRepository _apiRepository = ApiRepository();
    on<GetSearchedEventList>((event, emit) async {
      try {
        emit(SearchedEventLoading());

        final searchedEventsList = await _apiRepository.fetchSearchEvents(q);
        emit(SearchedEventLoaded(searchedEventsList)); 
      //  print(searchedEventsList.content!.meta!.total);
        if(searchedEventsList.content!.meta!.total == 0){
          emit(SearchedEventIsEmpty());
        }
        if (searchedEventsList.error != null) {
         emit(SearchedEventError(searchedEventsList.error));
        }
       // print(searchedEventsList);
      } on NetworkError {
        emit(const SearchedEventError("Failed to fetch data. is your device online?"));
      }
    });
  }
}

 
