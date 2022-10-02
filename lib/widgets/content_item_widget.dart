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

  Widget _buildAnimationWidget(
    Widget widget, {
    double aOffsetY = 50.0,
    int aMilSecDuration = 1200,
  }) {
    return Animator(
      tweenMap: {
        'opacity': Tween<double>(begin: -3, end: 1),
        'motion':
            Tween<Offset>(begin: Offset(0, aOffsetY), end: const Offset(0, 0))
      },
      duration: Duration(milliseconds: aMilSecDuration),
      curve: Curves.easeInOut,
      cycles: 1,
      builder: (_, anim, __) => FadeTransition(
        opacity: anim.getAnimation('opacity'),
        child: Transform.translate(
          offset: anim.getValue('motion'),
          child: widget,
        ),
      ),
    );
  }

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
              SizedBox(
                width: resumeContentModel.pictureWidth,
                height: utils.displayHeight() * 0.20,
                child: _buildAnimationWidget(
                  Image(
                    image: AssetImage(resumeContentModel.picture),
                    fit: BoxFit.contain,
                  ),
                  aMilSecDuration: 400,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: resumeContentModel.featureAreaPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAnimationWidget(
                Text(
                  resumeContentModel.topic,
                  style: TextStyle(
                    fontSize: 22.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                aOffsetY: -50,
                aMilSecDuration: 600,
              ),
              SizedBox(
                height: resumeContentModel.contentSpace,
              ),
              _buildAnimationWidget(
                Text(
                  resumeContentModel.feature,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.3,
                    fontSize: 15.0.sp,
                    color: constants.cTextFeatureColor,
                  ),
                ),
                aOffsetY: -50,
                aMilSecDuration: 800,
              ),
              if (resumeContentModel.showSeparateLine)
                SizedBox(
                  height: utils.displayHeight() * 0.1,
                  width: utils.displayWidth() * 0.50,
                  child: _buildAnimationWidget(
                    const Divider(
                      thickness: 1,
                      color: constants.cTextFeatureColor,
                    ),
                    aOffsetY: -50,
                    aMilSecDuration: 1000,
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
