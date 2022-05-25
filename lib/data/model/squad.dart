class Squad {
  int? id;
  String? name;
  String? position;
  String? dateOfBirth;
  String? countryOfBirth;
  String? nationality;
  int? shirtNumber;
  String? role;

  Squad(
      {this.id,
        this.name,
        this.position,
        this.dateOfBirth,
        this.countryOfBirth,
        this.nationality,
        this.shirtNumber,
        this.role});

  Squad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
    dateOfBirth = json['dateOfBirth'];
    countryOfBirth = json['countryOfBirth'];
    nationality = json['nationality'];
    shirtNumber = json['shirtNumber'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =  id;
    data['name'] =  name;
    data['position'] =  position;
    data['dateOfBirth'] =  dateOfBirth;
    data['countryOfBirth'] =  countryOfBirth;
    data['nationality'] =  nationality;
    data['shirtNumber'] =  shirtNumber;
    data['role'] =  role;
    return data;
  }
}