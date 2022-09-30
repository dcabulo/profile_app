import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart' as constants;
import '../utils.dart' as utils;
import '../models/resume_content_model.dart';
import 'package:animator/animator.dart';

class ContentItemWidget extends StatelessWidget {
  const ContentItemWidget(
      {Key? key, required this.contentList, required this.resumeContentModel})
      : super(key: key);

  final ResumeContentModel resumeContentModel;
  final List<ResumeContentModel> contentList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                width: resumeContentModel.pictureWidth,
                height: utils.displayHeight() * 0.20,
                child: Image(
                  image: AssetImage(resumeContentModel.picture),
                  fit: BoxFit.contain,
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ],
    );
  }
}
