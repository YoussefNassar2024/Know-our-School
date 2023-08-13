//TODO: add your view model class here
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:know_our_school/Model/model.dart';

class readSchoolData extends ChangeNotifier {
  List<School> schools = []; // List to store School objects

  readSchoolData() {
    _loadData();
  }

  Future<void> _loadData() async {
    String jsonString = await _loadJsonData();
    List<dynamic> jsonData = json.decode(jsonString);

    jsonData.forEach((schoolData) {
      School school = School(
        numberOfStudents: schoolData['Number of Students'],
        numberOfTeachers: schoolData['Number of Teachers'],
        schoolAddress: schoolData['School Address'],
        schoolName: schoolData['School Name'],
      );

      schools.add(school);
    });

    notifyListeners();
  }

  Future<String> _loadJsonData() async {
    String jsonText =
        await rootBundle.loadString('lib/JSONdata/SchoolData.json');
    return jsonText;
  }
}
