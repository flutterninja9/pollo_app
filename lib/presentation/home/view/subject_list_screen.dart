// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:pollo_education/di.dart';
// import 'package:pollo_education/models/subject_model.dart';
// import 'package:pollo_education/presentation/home/view/video_list_screen.dart';
// import 'package:pollo_education/utils/asyncValue/async_value.dart';

// import '../cubit/subject_list_cubit.dart';

// class SubjectListScreen extends StatelessWidget {
//   const SubjectListScreen({
//     Key? key,
//     required this.courseId,
//   }) : super(key: key);

//   static const routeName = '/subject-list-screen';
//   final String courseId;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           di<SubjectListCubit>()..getSubjectListByCourseId(courseId),
//       child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Subject List'),
//           ),
//           body: BlocBuilder<SubjectListCubit, AsyncValue<List<SubjectModel>>>(
//             builder: (context, state) {
//               return state.map(
//                 initial: (_) => const SizedBox(),
//                 loading: (_) => const Center(
//                   child: CircularProgressIndicator(),
//                 ),
//                 loaded: (value) {
//                   if (value.data.isEmpty) {
//                     return const Center(
//                       child: Text('No subjects found'),
//                     );
//                   }
//                   return ListView.builder(
//                     itemCount: value.data.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         leading: const Icon(Icons.book),
//                         onTap: () {
//                           di<GoRouter>().push(
//                             "${VideoListScreen.routeName}?course-id=${value.data[index].courseId}",
//                           );
//                         },
//                         title: Text(value.data[index].name),
//                         subtitle: Text(
//                             "Total Chapters: ${value.data[index].totalChapters}"),
//                       );
//                     },
//                   );
//                 },
//                 failure: (value) => const Center(
//                   child: Text('Error'),
//                 ),
//               );
//             },
//           )),
//     );
//   }
// }
