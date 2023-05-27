import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/di.dart';

import 'package:pollo_education/models/subject_model.dart';
import 'package:pollo_education/models/video_model.dart';
import 'package:pollo_education/presentation/home/cubit/subject_list_cubit.dart';
import 'package:pollo_education/presentation/home/cubit/video_list_cubit.dart';
import 'package:pollo_education/presentation/home/view/subject_videos_list_screen.dart';
import 'package:pollo_education/presentation/home/view/widgets/video_player_tile.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/utils/get_size.dart';
import 'package:pollo_education/utils/youtube_player/pollo_youtube_player.dart';

class ClassDetailScreen extends StatelessWidget {
  static const routeName = '/class-detail';
  const ClassDetailScreen({super.key, required this.courseId});

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di<SubjectListCubit>()..getSubjectListByCourseId(courseId),
      child: ClassDetailScreenView(courseId: courseId),
    );
  }
}

class ClassDetailScreenView extends StatefulWidget {
  final String courseId;
  const ClassDetailScreenView({
    Key? key,
    required this.courseId,
  }) : super(key: key);

  @override
  State<ClassDetailScreenView> createState() => _ClassDetailScreenViewState();
}

class _ClassDetailScreenViewState extends State<ClassDetailScreenView>
    with TickerProviderStateMixin {
  bool isSearch = false;
  late TabController _tabController;
  List<String> tabLabels = [];
  List<Widget> tabViews = [];
  List<SubjectModel> subjects = [];
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
  }

  initiateTabController(List<SubjectModel> subjects) {
    if (subjects.isNotEmpty) {
      for (var element in subjects) {
        tabLabels.add(element.subjectName!);
        tabViews.add(subjectListView(element.chapter!));
      }
    }
    _tabController = TabController(length: tabLabels.length, vsync: this);
    _tabController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.color.surface,
        body: Stack(
          children: [
            BlocBuilder<SubjectListCubit, AsyncValue<List<SubjectModel>>>(
                builder: (context, state) {
              return state.map(
                initial: (_) => const SizedBox(),
                loading: (_) =>
                    const Center(child: CircularProgressIndicator()),
                loaded: (value) {
                  if (subjects.isEmpty) {
                    initiateTabController(value.data);
                  }
                  subjects = value.data;

                  print(subjects);
                  return SafeArea(
                    child: subjects.isEmpty
                        ? Text('No subject found')
                        : Container(
                            color: R.color.blueColor,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: getSize(context).width,
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      decoration: BoxDecoration(
                                          color: R.color.surface,
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/Blogging-bro.png"),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 0.8,
                                              color: R.color.blueColor
                                                  .withOpacity(0.3))),
                                      child: IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            di<GoRouter>().pop();
                                          },
                                          icon: const FaIcon(
                                            FontAwesomeIcons.arrowLeft,
                                            size: 18,
                                          )),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text(
                                    "Select Subject Destination And Chapters:",
                                    style: TextStyle(
                                        color: R.color.surface,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Expanded(child: tabWidget(context)),
                              ],
                            ),
                          ),
                  );
                },
                failure: (e) => Text(e.reason),
              );
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              elevation: 20,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 16),
                              shadowColor: R.color.greenColor.withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: R.color.greenColor,
                              foregroundColor: R.color.surface),
                          onPressed: () {},
                          child: const Text(
                            'Join Now',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: R.color.yellowColor.withOpacity(0.1)),
                          child: Text(
                            '₹ 4000',
                            style: TextStyle(
                              color: R.color.yellowColor.withOpacity(0.8),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget tabWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
            isScrollable: true,
            labelColor: R.color.greenColor,
            indicatorColor: R.color.greenColor,
            controller: _tabController,
            onTap: (value) {},
            tabs: tabLabels
                .map(
                  (e) => Tab(
                    text: e,
                  ),
                )
                .toList()),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: tabViews,
          ),
        ),
      ],
    );
  }

  Widget subjectListView(List<Chapter> chapters) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                top: index == 0 ? 12 : 0, bottom: index == 9 ? 60 : 0),
            child: VideoPlayerTile(
                imgUrl:
                    'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                title: chapters[index].title!,
                subTitle: chapters[index].description!,
                onClickPlay: () {
                  di<GoRouter>().push(
                    "${PolloYoutubePlayer.routeName}?url=${chapters[index].link}",
                  );
                }),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }
}
