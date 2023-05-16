import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/models/video_model.dart';
import 'package:pollo_education/presentation/home/cubit/video_list_cubit.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';
import 'package:pollo_education/utils/youtube_player/pollo_youtube_player.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({
    Key? key,
    required this.courseId,
  }) : super(key: key);

  static const routeName = '/video-list-screen';
  final String courseId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di<VideoListCubit>()..getVideoListByCourseId(courseId),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Subject List'),
          ),
          body: BlocBuilder<VideoListCubit, AsyncValue<List<VideoModel>>>(
            builder: (context, state) {
              return state.map(
                initial: (_) => const SizedBox(),
                loading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (value) {
                  if (value.data.isEmpty) {
                    return const Center(
                      child: Text('No videos found'),
                    );
                  }
                  return ListView.builder(
                    itemCount: value.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          di<GoRouter>().push(
                            "${PolloYoutubePlayer.routeName}?url=${value.data[index].ytLink}",
                          );
                        },
                        leading: const Icon(Icons.book),
                        title: Text(value.data[index].title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Chapter: ${value.data[index].chapter}"),
                            Text(
                              "Description: ${value.data[index].description}",
                            ),
                          ],
                        ),
                        isThreeLine: true,
                      );
                    },
                  );
                },
                failure: (value) => const Center(
                  child: Text('Error'),
                ),
              );
            },
          )),
    );
  }
}
