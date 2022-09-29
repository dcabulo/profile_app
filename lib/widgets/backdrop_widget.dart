import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart' as constants;
import '../utils.dart' as utils;
import '../models/resume_content_model.dart';

class BackdropWidget extends StatelessWidget {
  const BackdropWidget(
      {Key? key, required this.contentList, required this.resumeContentModel})
      : super(key: key);

  final ResumeContentModel resumeContentModel;
  final List<ResumeContentModel> contentList;

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
                  Container(
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
              Spacer()
            ],
          ),
        )
      ],
    );
  }
}
