import 'package:flutter/material.dart';
import 'package:know_our_school/Model/model.dart';
import 'package:know_our_school/ViewModel/view_model.dart';
import 'package:provider/provider.dart';

class SchoolInfo extends StatefulWidget {
  @override
  State<SchoolInfo> createState() => _SchoolInfoState();
}

class _SchoolInfoState extends State<SchoolInfo> {
  String schoolName = "School Name";

  String schoolAddress = "School Address";

  String studentsNo = "Number of Students";

  String teachersNo = "Number of Teachers";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => readSchoolData(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: const Color(0xff477B71),
          leading: const Icon(
            Icons.menu,
            size: 30,
          ),
          title: const Text(
            'School Info',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/school.png',
                  width: 250,
                ),
              ),
              const SizedBox(height: 15),
              ReusableTextField(schoolName, Icons.school),
              const SizedBox(height: 15),
              ReusableTextField(schoolAddress, Icons.location_on_rounded),
              const SizedBox(height: 15),
              ReusableTextField(studentsNo, Icons.person),
              const SizedBox(height: 15),
              ReusableTextField(teachersNo, Icons.person),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Container(
                  width: 300,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, 1),
                        blurRadius: 12.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30.0),
                    color: const Color(0xffe9b637),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Consumer<readSchoolData>(
                      builder: (context, schoolProvider, _) {
                        if (schoolProvider.schools.isNotEmpty) {
                          School school = schoolProvider.schools[0];
                          return ButtonTheme(
                            minWidth: 300,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  schoolName = school.schoolName;
                                  schoolAddress = school.schoolAddress;
                                  studentsNo = school.numberOfStudents;
                                  teachersNo = school.numberOfTeachers;
                                });
                              },
                              child: const Text(
                                'Show Data',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableTextField extends StatelessWidget {
  final String text;
  final IconData iconShape;

  const ReusableTextField(this.text, this.iconShape);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xffd3d3d3),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Icon(iconShape, color: Colors.white, size: 35),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
