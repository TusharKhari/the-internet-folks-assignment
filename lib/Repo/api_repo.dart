import 'package:tif/data/model/event_model.dart';
import 'package:tif/data/model/searched_event_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<EventsModel> fetchAllEvents() {
    return _provider.getAllEvents();
  }
  Future<SearchedEventModel>  fetchSearchEvents(
     String q, 
  ){
    return _provider.getSearchedEvents(query: q );
  }
}
// getSearchedEvents

class NetworkError extends Error {}