import 'package:task_cubit/models/GroupOfColorsModel.dart';

class ColorsDataModel {
  late final String red;
  late final GroupOfColors groupOfColors;

  ColorsDataModel.fromJson(Map<String, dynamic> json){
    red = json['red'];
    groupOfColors = GroupOfColors.fromJson(json['groupOfColors']);
  }
}






