import 'package:my_portfolio/core/routes/routes.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/models/link.dart';
import 'package:my_portfolio/models/technology.dart';

class ProjectModel {
  final String project;
  final String title;
  final String description;
  final String? appPhotos;
  final String projectLink;
  final bool internalLink;
  final List<TechnologyModel> techUsed;
  List<LinkModel>? links = [];
  final String? buttonText;

  ProjectModel({
    required this.project,
    required this.title,
    required this.description,
    this.appPhotos,
    required this.projectLink,
    this.internalLink = false,
    required this.techUsed,
    this.buttonText,
    this.links,
  });

  static List<ProjectModel> projects = [
    ProjectModel(
      project: "Flutter App",
      title: "Plank: Full Body Workouts",
      description:
          "Full Body Workout, your ultimate solution for a stronger, more defined core and an all-round fitness boost. Ready to transform your plank workouts and achieve the flat stomach you desire? Then look no further!",
      appPhotos: AppConstants.plank,
      projectLink: "https://play.google.com/store/apps/details?id=com.home.workout.apps.plank.workout.fitness.plank",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.firebase,
      ],
      buttonText:  "Product Link",
    ),
    ProjectModel(
      project: "Flutter App",
      title: "3t: User App",
      description:
      "Welcome to The 3T Fitness app At 3T Fitness, we're dedicated to empowering you with the tools to master your health and fitness for life. Whether you're a seasoned fitness enthusiast or just embarking on your wellness journey, our mission is to provide a service that assists users in achieving their fitness goals, staying motivated, and leading a healthier lifestyle.",
      appPhotos: AppConstants.nutuneFitness,
      projectLink: "https://app.nutonefitness.com/",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.firebase,
      ],
      buttonText:  "Product Link",
    ),
    ProjectModel(
      project: "Flutter App",
      title: "ETRIP Your Gateway To Exquisite Journeys",
      description: "Experience Saudi Arabia like never before! Get a year-long Multiple Personal Visit Visa to explore this amazing country at an incredible price.",
      appPhotos: AppConstants.etrip,
      projectLink: "https://etrip.pk/",

      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.firebase,
        TechnologyConstants.sceneKit,
      ],
      buttonText: "Website Link",
    ),
    ProjectModel(
      project: "Flutter App",
      title: "SRAN (Posture Corrector)",
      description: "SRAN is an innovative mobile app designed to complement our line of posture correctors, brought to you by Shay Raja. It serves as your personalized posture tracking companion, helping you achieve better posture and overall well-being.",
      appPhotos: AppConstants.sran,
      projectLink: 'https://github.com/Asif-shah786/sran.git',
      techUsed: [
        TechnologyConstants.flutter,
      ],
      buttonText: "Github Link",
    ),
    ProjectModel(
      project: "Flutter App",
      title: "Plank Admin Dashboard",
      description:
      "Full Body Workout, your ultimate solution for a stronger, more defined core and an all-round fitness boost. Ready to transform your plank workouts and achieve the flat stomach you desire? Then look no further!",
      appPhotos: AppConstants.plankAdmin,
      projectLink: "https://play.google.com/store/apps/details?id=com.home.workout.apps.plank.workout.fitness.plank",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.firebase,
      ],
      buttonText:  "Product Link",
    ),
    ProjectModel(
      project: "Flutter App",
      title: "Want Yatch Crew",
      description: "WantYachtCrew is a game-changing app transforming yacht crew recruitment. Designed for Yacht Captains and Crew, the platform offers easy account creation, empowering Captains to showcase yacht details and browse crew profiles through a Tinder-like card system, swiping right for interest. Crew members display qualifications and availability, accepting or rejecting Captain requests as per schedule. Seamlessly integrated chat fosters direct communication for finalizing arrangements, while secure in-app payments facilitate smooth transactions. Location services ensure real-time mapping of yacht, Captain, and crew locations, enhancing coordination. ",
      appPhotos: AppConstants.crew,
      projectLink: 'https://www.wantyachtcrew.com/',
      techUsed: [
        TechnologyConstants.flutter,
      ],
      buttonText: "Website Link",
    ),
  ];

  static List<ProjectModel> demos = [
    ProjectModel(
      project: "Flutter App",
      title: "Flutter Web Portfolio",
      description: "",
      appPhotos: AppConstants.portfolioGif,
      projectLink: "https://github.com/AgnelSelvan/Flutter-Web-Portfolio",
      techUsed: [],
      buttonText: "Github Link",
    ),
  ];
}
