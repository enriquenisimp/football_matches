
class Areas {
  int? count;
  List<Area>? area;

  Areas({this.count, this.area});

  Areas.fromJson(Map<String, dynamic> json) {
    print("locjojo");
    count = json['count'];
    if (json['areas'] != null) {
      area = <Area>[];
      json['areas'].forEach((v) { area!.add(Area.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (area != null) {
      data['areas'] = area!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Area {
  int? id;
  String? name;

  Area({this.id, this.name});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}