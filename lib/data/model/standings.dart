import 'package:football_matches/data/model/table_position.dart';

class Standings {
  String? stage;
  String? type;
  List<Table>? table;

  Standings({this.stage, this.type,this.table});

  Standings.fromJson(Map<String, dynamic> json) {
    stage = json['stage'];
    type = json['type'];
    if (json['table'] != null) {
      table = <Table>[];
      json['table'].forEach((v) { table!.add(Table.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stage'] = stage;
    data['type'] = type;
    if (table != null) {
      data['table'] = table!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}