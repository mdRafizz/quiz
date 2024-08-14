import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/model/question_paper_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    final fireStore = FirebaseFirestore.instance;
    final manifestContext =
        await DefaultAssetBundle.of(Get.context!).loadString(
      'AssetManifest.json',
    );
    final Map<String, dynamic> manifestMap = json.decode(manifestContext);
    final paperInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith('assets/DB/paper') && path.contains('.json'))
        .toList();

    List<QuestionPaperModel> questionPapers = [];
    for(var paper in paperInAssets){
      String paperContent = await rootBundle.loadString(paper);
      // print(paperContent);
      questionPapers.add(QuestionPaperModel.fromJson(json.decode(paperContent),),);
    }
    print(questionPapers[2].questions![1].answers?[1].answer);
  }
}
