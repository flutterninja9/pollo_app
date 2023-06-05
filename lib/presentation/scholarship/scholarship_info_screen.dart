import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/presentation/scholarship/cubit/scholarship_info_cubit.dart';
import 'package:pollo_education/presentation/scholarship/widgets/scholarship_info_widget.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/utils/get_size.dart';

class ScholarshipInfoScreen extends StatelessWidget {
  static const String routeName = '/scholarshipInfo';
  const ScholarshipInfoScreen({
    Key? key,
    required this.examId,
  }) : super(key: key);
  final String examId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di<ScholarshipInfoCubit>()..fetchScholarshipInfoByExamId(examId),
      child: const ScholarshipInfoScreenView(),
    );
  }
}

class ScholarshipInfoScreenView extends StatelessWidget {
  const ScholarshipInfoScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: R.color.blueColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 120,
                    width: getSize(context).width,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: R.color.surface,
                        image: const DecorationImage(
                          image: AssetImage("assets/Blogging-bro.png"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 0.8,
                            color: R.color.blueColor.withOpacity(0.3))),
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
              Expanded(child:
                  BlocBuilder<ScholarshipInfoCubit, ScholarshipInfoCubitState>(
                      builder: (context, state) {
                return state.scholarshipInfo.map(
                    initial: (_) => const SizedBox.shrink(),
                    loading: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (value) {
                      final scholarship = value.data;
                      return Stack(
                        children: [
                          ScholarshipInfoWidget(
                            scholarshipInfo: scholarship,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: getSize(context).width - 64,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    elevation: 20,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    shadowColor:
                                        R.color.greenColor.withOpacity(0.4),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    backgroundColor: R.color.greenColor,
                                    foregroundColor: R.color.surface),
                                onPressed: () {},
                                child: const Text(
                                  'Enroll Now',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    failure: (value) => Center(
                          child: Text(value.reason),
                        ));
              })),
            ],
          ),
        ),
      ),
    );
  }
}
