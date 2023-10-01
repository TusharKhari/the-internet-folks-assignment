import 'dart:io';

import 'package:dio/dio.dart'; 
import 'package:tif/data/model/event_model.dart';
import 'package:tif/data/model/searched_event_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://sde-007.api.assignment.theinternetfolks.works/v1/event';

  Future<EventsModel> getAllEvents() async {
    try {
      Response response = await _dio.get(_url,  );
      return EventsModel.fromJson(response.data);
    } 
    on SocketException{
      return EventsModel.withError("Connection issue");
    } 
    on DioException{
      //if()
      // DioException.connectionError(requestOptions: RequestOptions(), reason: "reason");
      return  EventsModel.withError("Connection issue");
    }
    catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return EventsModel.withError("Data not found / Connection issue");
    }
  }

    Future<SearchedEventModel> getSearchedEvents(
    { 
      required String query, 
    }
  )async{
    String _searchUrl = "https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=$query";
    try {
      Response response = await _dio.get(_searchUrl);
     // print(response);
     return SearchedEventModel.fromJson(response.data);
    } 
    on SocketException{
      return SearchedEventModel.withError("Connection issue");
    } 
    on DioException{
      //if()
      // DioException.connectionError(requestOptions: RequestOptions(), reason: "reason");
     return  SearchedEventModel.withError("Connection issue");
    }
    catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SearchedEventModel.withError("Data not found / Connection issue");
    }
  }}