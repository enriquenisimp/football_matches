import 'package:football_matches/core/data/data_constants.dart';

enum DataService {
  areas,
  competitions,
  teams
}

extension DataServiceExtension on DataService {

  String get url {
    switch (this){
      case DataService.areas:
        return DataConstants.baseUrl+DataConstants.areas;
      case DataService.competitions:
        return DataConstants.baseUrl+DataConstants.competitions;
      case DataService.teams:
        return DataConstants.baseUrl+DataConstants.teams;
    }
  }
}