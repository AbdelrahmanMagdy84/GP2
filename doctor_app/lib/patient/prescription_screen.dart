
import 'package:doctor_app/items/medical_record_item.dart';
import 'package:doctor_app/models/MedicalRecord.dart';
import 'package:doctor_app/models/Responses/MedicalRecordsResponse.dart';
import 'package:doctor_app/services/APIClient.dart';
import 'package:doctor_app/utils/TokenStorage.dart';
import 'package:flutter/material.dart';

class PrescriptionScreen extends StatefulWidget {
  static final routeName = 'Prescription route name';
  @override
  _PrescriptionScreenState createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  Future userFuture;
  List<MedicalRecord> medicalRecords;
  @override
  void initState() {
    super.initState();
    print("getting user token");
    getUserToken();
  }

  String _patientToken;
  void getUserToken() {
    TokenStorage().getUserToken().then((value) async {
      setState(() {
        _patientToken = value;
      });
      userFuture = APIClient()
          .getMedicalRecordService()
          .getMedicalRecords(_patientToken)
          .then((MedicalRecordsResponse responseList) {
        if (responseList.success) {
          medicalRecords = responseList.medicalRecord;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prescription")),
      body:  Container(
        child: FutureBuilder(
          future: userFuture,
          builder: (ctx, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text("none");
                break;
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                    child: Text(
                  "Loading ",
                  style: Theme.of(context).textTheme.title,
                ));
                break;
              case ConnectionState.done:
                return ListView.builder(
                  itemBuilder: (ctx, index) {
                    return MedicalRecordItem(medicalRecords[index]);
                  },
                  itemCount: medicalRecords.length,
                );
                break;
            }
          },
        ),
      ),
    );
  }

 
}
