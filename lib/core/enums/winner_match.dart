enum WinnerMatch{
  awayTeam,
  homeTeam,
  draw
}

extension WinnerMatchExtension on WinnerMatch {

  String get value {
    switch (this){
      case WinnerMatch.awayTeam:
        return "AWAY_TEAM";
      case WinnerMatch.homeTeam:
        return "HOME_TEAM";
      case WinnerMatch.draw:
        return "DRAW";
    }
  }
}

  WinnerMatch realValue(String value){
  if(value==WinnerMatch.awayTeam.value){
    return WinnerMatch.awayTeam;
  }
  if(value==WinnerMatch.awayTeam.value){
    return WinnerMatch.awayTeam;
  }

  return WinnerMatch.draw;
}