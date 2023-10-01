


import 'package:equatable/equatable.dart';
import 'package:tif/data/model/event_model.dart';

abstract class AllEventState extends Equatable {
  const AllEventState();

  @override
  List<Object?> get props => [];
}

class AllEventsInitial extends AllEventState {}

class AllEventsLoading extends AllEventState {}

class AllEventsLoaded extends AllEventState {
  final EventsModel eventsModel;
    const AllEventsLoaded(this.eventsModel);
}

class AllEventsError extends AllEventState {
  final String? message;
  const AllEventsError(this.message);
}





// import 'package:tif/data/model/event_model.dart';

// abstract class AllEventState {}

// class AllEventFetchingState extends AllEventState{
//   List<Object?> get allEventsList => [];
// }

// class AllEventFetchedState extends AllEventState{
//   List<EventsModel> ? allEvents;
//   AllEventFetchedState(this.allEvents);
//   List<Object?> get allEventsList => [allEvents];
// }

// class AllEventFetchingErrorState extends AllEventState{
//   final String error;
//   AllEventFetchingErrorState(this.error);
//   List<Object?> get allEventsList => [error];
// }


