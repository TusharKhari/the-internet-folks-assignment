

import 'package:equatable/equatable.dart';

abstract class SearchedEventEvent extends Equatable {
  const SearchedEventEvent();
  
  @override
  List<Object?> get props => [];
}

class GetSearchedEventList extends SearchedEventEvent{}