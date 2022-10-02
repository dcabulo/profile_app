import './constants.dart' as constants;
import './models/resume_content_model.dart';
import './models/display_screen.dart';

double displayWidth() => DisplayScreen.displayWidth;
double displayHeight() => DisplayScreen.displayHeight;

final List<ResumeContentModel> contentList = [
  ResumeContentModel(
      constants.cProfileTopic,
      constants.cProfileFeature,
      constants.cProfileLabel,
      constants.cProfilePicture,
      constants.cProfileIconImage,
      constants.cProfileColor,
      constants.cProfileBegColor,
      constants.cProfileEndColor,
      displayWidth() * 0.26,
      42.0,
      displayHeight() * 0.02,
      26.0),
  ResumeContentModel(
      constants.cEducationTopic,
      constants.cEducationFeature,
      constants.cEducationLabel,
      constants.cEducationPicture,
      constants.cEducationIconImage,
      constants.cEducationColor,
      constants.cEducationBegColor,
      constants.cEducationEndColor,
      displayWidth() * 0.30,
      42.0,
      displayHeight() * 0.05,
      26.0,
      showSeparateLine: true),
  ResumeContentModel(
      constants.cExperienceTopic,
      constants.cExperienceFeature,
      constants.cExperienceLabel,
      constants.cExperiencePicture,
      constants.cExperienceIconImage,
      constants.cExperienceColor,
      constants.cExperienceBegColor,
      constants.cExperienceEndColor,
      displayWidth() * 0.30,
      42.0,
      displayHeight() * 0.05,
      26.0)
];
