class UserSelections{
  final String? idArea;
  final String? idCompetition;

  const UserSelections({
    this.idArea,
    this.idCompetition,
  });

  UserSelections copyWith({
    String? idArea,
    String? idCompetition,
  }) {
    return UserSelections(
      idArea: idArea ?? this.idArea,
      idCompetition: idCompetition ?? this.idCompetition,
    );
  }

}