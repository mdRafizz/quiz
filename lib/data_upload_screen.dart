import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controllers/question_paper/data_uploader.dart';

class DataUploadScreen extends StatelessWidget {
  const DataUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put<DataUploader>(DataUploader());
    return Scaffold(
      body: Center(
        child: Text('uploading...'),
      )
    );
  }
}
