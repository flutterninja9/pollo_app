import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/presentation/home/view/home_screen_container.dart';
import 'package:pollo_education/presentation/onboarding/cubit/board_selection_cubit.dart';
import 'package:pollo_education/presentation/onboarding/view/widgets/board_tile.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/utils/get_size.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardSelectionView extends StatefulWidget {
  const BoardSelectionView({super.key, required this.stateName});

  final String stateName;

  @override
  State<BoardSelectionView> createState() => _BoardSelectionViewState();
}

class _BoardSelectionViewState extends State<BoardSelectionView> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    context.read<BoardSelectionCubit>().getBoardListByState(widget.stateName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardSelectionCubit, AsyncValue<List<BoardModel>>>(
        builder: (context, state) {
      return state.map(
        initial: (_) => const SizedBox(),
        loading: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        loaded: (value) {
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Select your board',
                      style: TextStyle(
                          color: R.color.blueColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 2,
                      width: 100,
                      decoration: BoxDecoration(
                          color: R.color.greenColor,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: boardList(value.data),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: FloatingActionButton(
                    onPressed: () async {
                      if (selectedIndex != -1) {
                        await di<SharedPreferences>().setString(
                          'boardName',
                          value.data[selectedIndex].name,
                        );
                        di<GoRouter>().go(HomeScreenContainer.routeName);
                      }
                    },
                    child: FaIcon(
                      FontAwesomeIcons.arrowRight,
                      color: R.color.surface,
                    ),
                  ),
                ),
              )
            ],
          );
        },
        failure: (value) => SizedBox(
          child: Text(value.reason),
        ),
      );
    });
  }

  List<Widget> boardList(List<BoardModel> boards) {
    List<Widget> boardWidget = [];
    for (int i = 0; i < boards.length; i++) {
      Widget item = GestureDetector(
          onTap: () {
            selectedIndex = i;
            setState(() {});
          },
          child: BoardTile(board: boards[i], isSelected: selectedIndex == i));
      boardWidget.add(item);
    }
    return boardWidget;
  }
}
