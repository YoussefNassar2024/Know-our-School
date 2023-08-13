//TODO: add your view model class here
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:know_our_school/Model/model.dart';

class readSchoolData extends ChangeNotifier {
  School schools = School(
      numberOfStudents: "Number of Students",
      numberOfTeachers: "Number of Teachers",
      schoolAddress: "School Address",
      schoolName: "School Name"); // List to store School objects

  getSchoolData() {
    _loadData();
  }

  Future<void> _loadData() async {
    String jsonString = await _loadJsonData();
    List<dynamic> jsonData = json.decode(jsonString);

    jsonData.forEach((schoolData) {
      schools = School(
        numberOfStudents: schoolData['Number of Students'],
        numberOfTeachers: schoolData['Number of Teachers'],
        schoolAddress: schoolData['School Address'],
        schoolName: schoolData['School Name'],
      );
    });

    notifyListeners();
  }

  Future<String> _loadJsonData() async {
    String jsonText =
        await rootBundle.loadString('lib/JSONdata/SchoolData.json');
    return jsonText;
  }
}
