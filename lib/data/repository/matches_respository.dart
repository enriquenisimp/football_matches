import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:football_matches/core/data/data_constants.dart';
import 'package:football_matches/core/data/data_service.dart';
import 'package:football_matches/core/data/interceptors/auth_interceptor.dart';
import 'package:football_matches/data/model/area.dart';
import 'package:football_matches/data/model/matches_by_competition.dart';
import 'package:football_matches/data/model/standing_by_competition.dart';
import 'package:football_matches/data/model/team.dart';
import 'package:football_matches/data/model/team_details.dart';
import 'package:football_matches/data/repository/i_matches_repository.dart';
import '../model/competition.dart';

class MatchesRepository implements IMatchesRepository{
  final Dio dio;
  MatchesRepository(this.dio);

  @override
  Future<Competitions?> getCompetitions() async {
    dio.interceptors.add(AuthInterceptor());
    dio.options.headers={'X-Auth-Token': '8ff0ad0cb305461fbbef23207a4fb3fb'};

    try {
      final result = await dio.get(DataService.competitions.url);
      return Competitions.fromJson(result.data);
    }catch(error){
    if(error is DioError) {
      log('here the error: ${error.message}');
    }
      return null;
    }

  }

  @override
  Future<Areas> getAreas() async  {
    dio.interceptors.add(AuthInterceptor());
    try {
      final result = await dio.get(
          DataConstants.baseUrl + DataConstants.areas);
      if(result.data!=null) {
        return Areas.fromJson(result.data);
      } else {
        log(result.statusMessage??'');
        return Areas(count: 0);
      }

    }catch(error){
      log(error.toString());
    }
    return Areas(count: 0);
  }

  @override
  Future<MatchesByCompetition?> getWinner(String idCompetition) async {
    dio.interceptors.add(AuthInterceptor());
    try {
      print(DataService.competitions.url + DataConstants.addParameter(idCompetition) + DataConstants.matches+"?dateFrom=2022-05-10&dateTo=2022-05-18");
      final result = await dio.get(
          DataService.competitions.url + DataConstants.addParameter(idCompetition) + DataConstants.matches);
      print("data from backend: ${result.data}");
      if(result.data!=null) {
        return MatchesByCompetition.fromJson(result.data);
      } else {
        log(result.statusMessage??'');
        return null;
      }

    }catch(error){
      log(error.toString());
    }
    return null;
  }

  @override
  Future<TeamDetails?> getTeamDetails(String idTeam) async {
    dio.interceptors.add(AuthInterceptor());
    try {
      print(DataService.teams.url + DataConstants.addParameter(idTeam));
      final result = await dio.get(
          DataService.teams.url + DataConstants.addParameter(idTeam));

      if(result.data!=null) {
        return TeamDetails.fromJson(result.data);
      } else {
        log(result.statusMessage??'');
        return null;
      }

    }catch(error){
      log(error.toString());
    }
    return null;
  }

}