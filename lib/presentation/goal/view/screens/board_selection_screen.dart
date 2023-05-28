import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:pollo_education/di.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/presentation/goal/view/widgets/goal_list_tile.dart';
import 'package:pollo_education/presentation/goal/view/widgets/goal_selection_tile.dart';
import 'package:pollo_education/presentation/home/cubit/get_class_cubit.dart';
import 'package:pollo_education/presentation/home/view/class_detail_screen.dart';
import 'package:pollo_education/presentation/onboarding/cubit/board_selection_cubit.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/utils/get_size.dart';

class BoardSelectionScreen extends StatelessWidget {
  static const routeName = "/goal/board";
  const BoardSelectionScreen({
    Key? key,
    required this.stateName,
  }) : super(key: key);
  final String stateName;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                di<BoardSelectionCubit>()..getBoardListByState(stateName)),
        BlocProvider(create: (context) => di<GetClassCubit>())
      ],
      child: const BoardSelectionScreenView(),
    );
  }
}

class BoardSelectionScreenView extends StatefulWidget {
  const BoardSelectionScreenView({super.key});

  @override
  State<BoardSelectionScreenView> createState() =>
      _BoardSelectionScreenViewState();
}

class _BoardSelectionScreenViewState extends State<BoardSelectionScreenView> {
  bool isLoading = false;
  List<ClassModel> classes = [];

  getClassList(String boardName) async {
    isLoading = true;

    final data =
        await context.read<GetClassCubit>().getClassListByBoardName(boardName);
    classes = data;
    isLoading = false;
    setState(() {});
    if (classes.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('No classes found!'),
            );
          });
    } else {
      showBoardDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<BoardSelectionCubit, AsyncValue<List<BoardModel>>>(
          builder: (context, state) {
            return state.map(
                initial: (_) => const SizedBox(),
                loading: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                loaded: (value) {
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 0.8,
                                      color:
                                          R.color.blueColor.withOpacity(0.3))),
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
                            Text(
                              "Select your board",
                              style: TextStyle(
                                  color: R.color.blueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            itemCount: value.data.length,
                            itemBuilder: (context, index) {
                              final board = value.data[index];
                              return Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: GoalListTile(
                                  imgUrl:
                                      'https://polloeducation.tunajifoundation.com/public/storage/upload/${board.image}',
                                  title: board.name,
                                  onTap: () {
                                    getClassList(board.name);
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                },
                failure: (e) => Center(child: Text(e.reason)));
          },
        ),
      ),
    );
  }

  void showBoardDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              title: SizedBox(
                width: getSize(context).width,
                child: SizedBox(
                  width: getSize(context).width,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: R.color.blueColor)),
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
                      const SizedBox(width: 16),
                      Text(
                        'Select your class',
                        style: TextStyle(color: R.color.blueColor),
                      ),
                    ],
                  ),
                ),
              ),
              content: SizedBox(
                height: getSize(context).height,
                width: getSize(context).width,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: classes.length,
                        itemBuilder: (context, index) {
                          return GoalListTile(
                              title: classes[index].classNAme,
                              onTap: () {
                                di<GoRouter>().push(
                                    "${ClassDetailScreen.routeName}?course-id=${classes[index].courseId}");
                              });
                        },
                      ),
              ),
            );
          });
        });
  }
}
