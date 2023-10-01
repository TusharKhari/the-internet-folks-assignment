

import 'package:equatable/equatable.dart';
import 'package:tif/data/model/searched_event_model.dart';

abstract class SearchedEventState extends Equatable {
  const SearchedEventState();
  
  @override
  List<Object?> get props => [];
}


class SearchedEventsInitial extends SearchedEventState{ 
}

class  SearchedEventLoading extends  SearchedEventState{}

class  SearchedEventLoaded extends  SearchedEventState{
  final SearchedEventModel searchedEventModel;
  const SearchedEventLoaded(this.searchedEventModel);
}

class  SearchedEventError extends  SearchedEventState {
  final String ? msg;
   const SearchedEventError(this.msg);
}

class SearchedEventIsEmpty extends SearchedEventState {
}
