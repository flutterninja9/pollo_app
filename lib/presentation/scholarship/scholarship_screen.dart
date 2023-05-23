import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/models/scholarship_model.dart';
import 'package:pollo_education/presentation/scholarship/cubit/get_scholarships_cubit.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/utils/get_size.dart';

class ScholarShipScreen extends StatelessWidget {
  static const String routeName = '/scholarship';
  const ScholarShipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<GetScholarshipsCubit>()..getScholarshipList(),
      child: const ScholarshipScreenView(),
    );
  }
}

class ScholarshipScreenView extends StatelessWidget {
  const ScholarshipScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: R.color.blueColor,
          child: Column(
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  "Find your best scholarship and click to enroll now",
                  style: TextStyle(
                      color: R.color.surface,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(child: BlocBuilder<GetScholarshipsCubit,
                      AsyncValue<List<ScholarshipModel>>>(
                  builder: (context, state) {
                return state.map(
                    initial: (_) => const SizedBox.shrink(),
                    loading: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (value) {
                      final scholarships = value.data;
                      return ListView.builder(
                          itemCount: scholarships.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              width: getSize(context).width,
                              height: 200,
                              decoration: BoxDecoration(
                                color: R.color.greenColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: R.color.blueColor),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://polloeducation.tunajifoundation.com/public/storage/upload/${scholarships[index].image}'),
                                    fit: BoxFit.cover),
                              ),
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            R.color.blueColor.withOpacity(0.9),
                                        border: Border.all(
                                            color: R.color.greenColor)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          scholarships[index].name!,
                                          style: TextStyle(
                                              color: R.color.surface,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Quastions: ${scholarships[index].totalQuestion}",
                                              style: TextStyle(
                                                  color: R.color.surface,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "Marks: ${scholarships[index].marks}",
                                              style: TextStyle(
                                                  color: R.color.surface,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Duration: ${scholarships[index].duration}",
                                              style: TextStyle(
                                                  color: R.color.surface,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "Date: ${scholarships[index].date}",
                                              style: TextStyle(
                                                  color: R.color.surface,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 32),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                    elevation: 20,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                    shadowColor: R
                                                        .color.greenColor
                                                        .withOpacity(0.4),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    backgroundColor:
                                                        R.color.greenColor,
                                                    foregroundColor:
                                                        R.color.surface),
                                                onPressed: () {},
                                                child: const Text(
                                                  'Enroll Now',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.arrow_forward,
                                                    color: R.color.surface
                                                        .withOpacity(0.5),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
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
