import 'package:doctor_app/patient/allergies_screen.dart';
import 'package:doctor_app/patient/condtions_screen.dart';
import 'package:doctor_app/drawer/edit_doctor_info_screen.dart';
import 'package:doctor_app/screens/facility_screen.dart';
import 'package:doctor_app/patient/blood_pressure_screen.dart';
import 'package:doctor_app/patient/patient_profile_screen.dart';
import 'package:doctor_app/patient/glucose_screen.dart';
import 'package:doctor_app/patient/lab_test_screen.dart';
import 'package:doctor_app/screens/home_screen.dart';
import 'package:doctor_app/screens/login_screen.dart';
import 'package:doctor_app/patient/prescription_screen.dart';
import 'package:doctor_app/patient/radiograph_screen.dart';
import 'package:doctor_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'drawer/clerk_profile_screen.dart';
import 'screens/facility_profile_screen.dart';
import 'patient/medications_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.amber,
          primarySwatch: Colors.blue,
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => LoginScreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        PatientProfileScreen.routeName: (ctx) => PatientProfileScreen(),
        AllergiesScreen.routeName: (ctx) => AllergiesScreen(),
        ConditionsScreen.routeName: (ctx) => ConditionsScreen(),
        PrescriptionScreen.routeName: (ctx) => PrescriptionScreen(),
        BloodPressureScreen.routeName: (ctx) => BloodPressureScreen(),
        BloodGlucoseScreen.routeName: (ctx) => BloodGlucoseScreen(),
        RadiographScreen.routeName: (ctx) => RadiographScreen(),
        LabTestScreen.routeName: (ctx) => LabTestScreen(),
        FacilityScreen.routeName: (ctx) => FacilityScreen(),
        EditPatientInfo.routeName: (ctx) => EditPatientInfo(),
        MedicationsScreen.routeName: (ctx) => MedicationsScreen(),
        ClerkProfileScreen.routeName: (ctx) => ClerkProfileScreen(),
        FacilityProfileScreen.routeName: (ctx) => FacilityProfileScreen(),
      },
    );
  }
}
