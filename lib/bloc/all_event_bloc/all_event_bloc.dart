// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Repo/api_repo.dart';
import 'all_event_event.dart';
import 'all_event_state.dart';

class AllEventBloc extends Bloc<AllEventEvent,AllEventState > {
  
  AllEventBloc( 
  ) : super(AllEventsInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetAllEventList>((event, emit) async {
      try {
        emit(AllEventsLoading());
        final allEventsList = await apiRepository.fetchAllEvents();
        emit(AllEventsLoaded(allEventsList));
        if (allEventsList.error != null) {
          emit(AllEventsError(allEventsList.error));
        }
      } on NetworkError {
        emit(const AllEventsError("Failed to fetch data. is your device online?"));
      }
    });
  }
}





