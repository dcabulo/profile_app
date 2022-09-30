import 'package:flutter/material.dart';
import 'package:another_transformer_page_view/another_transformer_page_view.dart';

import '../utils.dart' as utils;
import '../constants.dart' as constants;
import '../models/display_screen.dart';
import '../widgets/backdrop_widget.dart';
import '../widgets/content_item_widget.dart';
import '../widgets/content_transformer.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  _ResumeScreenState createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  var _currentIndex = constants.cStartingIndex;

  @override
  Widget build(BuildContext context) {
    DisplayScreen().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                height: utils.displayHeight() * 0.18,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Diego Cabulo Dev',
                    style: TextStyle(
                      fontSize: constants.cCaptionTextSize,
                      fontWeight: FontWeight.bold,
                      color: constants.cTextFeatureColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Stack(
                    children: [
                      BackdropWidget(
                        contentList: utils.contentList,
                        resumeContentModel: utils.contentList[_currentIndex],
                      ),
                      _buildResumePage()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResumePage() {
    return Container(
      child: TransformerPageView(
        itemCount: utils.contentList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, id) => ContentItemWidget(
          contentList: utils.contentList,
          resumeContentModel: utils.contentList[id],
        ),
        onPageChanged: ((currentId) {
          setState(() {
            _currentIndex = currentId!;
          });
        }),
      ),
    );
  }
}
