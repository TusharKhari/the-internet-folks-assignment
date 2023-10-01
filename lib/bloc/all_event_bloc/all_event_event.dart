

import 'package:equatable/equatable.dart'; 

// abstract class 
// AllEventEvent {}



//  class AllEventFetchingState{

//    void services = ApiServices().getAllEvents();
//  }

//  class AllEventFetchedState{
   
//  }

 
// abstract class AllEventEvent {
//   const AllEventEvent();
// }

// class LoadEventEvent extends AllEventEvent {
//   List<Object?> get allEventList => [];
// }


abstract class AllEventEvent extends Equatable {
    const AllEventEvent();

  @override
  List<Object> get props => [];
}

class GetAllEventList extends AllEventEvent {}