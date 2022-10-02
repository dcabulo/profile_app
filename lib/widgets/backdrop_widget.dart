import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart' as constants;
import '../utils.dart' as utils;
import '../models/resume_content_model.dart';
import 'package:collection/collection.dart';

class BackdropWidget extends StatelessWidget {
  const BackdropWidget(
      {Key? key, required this.contentList, required this.resumeContentModel})
      : super(key: key);

  final ResumeContentModel resumeContentModel;
  final List<ResumeContentModel> contentList;

  List<Widget> _buildNavigator() => contentList
      .mapIndexed(
        (index, element) => Container(
          alignment: Alignment.center,
          width: 11.0,
          height: 11.0,
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: contentList.indexOf(resumeContentModel) == index
                ? resumeContentModel.viewColor
                : null,
            border: Border.all(color: element.viewColor),
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: resumeContentModel.iconWidth,
                    child: Image(
                      image: AssetImage(resumeContentModel.iconimage),
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              )),
              Container(
                width: utils.displayWidth() * 0.38,
                height: utils.displayHeight() * 0.20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      resumeContentModel.beginGradient,
                      resumeContentModel.endGradient
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.1, 1.0],
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 20,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildNavigator(),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        Expanded(
            child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            color: resumeContentModel.viewColor,
            height: utils.displayHeight() * 0.1,
            alignment: Alignment.center,
            child: Text(
              resumeContentModel.label,
              style: TextStyle(
                fontSize: 18.0.sp,
                fontWeight: FontWeight.bold,
                color: constants.cTextLabelColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ))
      ],
    );
  }
}
