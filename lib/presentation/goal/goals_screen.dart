import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/presentation/goal/cubit/goals_cubit.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  static const routeName = '/goals';
  static final options = <_AppOption>[
    const _AppOption(
      label: "Scholarship",
      icon: Icon(Icons.school),
    ),
    const _AppOption(
      label: "State board learning",
      icon: Icon(Icons.science),
    ),
    const _AppOption(
      label: "Basic learning",
      icon: Icon(Icons.book),
    ),
    const _AppOption(
      label: "Computer learning",
      icon: Icon(Icons.computer),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<GoalsCubit>()..fetchScholarshipLevelAndClass(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Goals (BANA DENA ISKO)'),
        ),
        body: BlocBuilder<GoalsCubit, GoalsCubitState>(
          builder: (context, state) {
            return state.level.map(
                initial: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                loading: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                loaded: (value) {
                  return CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Text(
                            "Popular goals",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final option = options[index];
                          return ExpansionTile(
                            leading: option.icon,
                            title: Text(
                              option.label,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: const Icon(Icons.add),
                            children: const [],
                          );
                        }, childCount: options.length),
                      ),
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Text(
                            "Popular goals",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final option = value.data[index];
                          return ExpansionTile(
                            leading: const Icon(Icons.abc_outlined),
                            title: Text(
                              option.level,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: const Icon(Icons.add),
                            children: const [],
                          );
                        }, childCount: value.data.length),
                      ),
                    ],
                  );
                },
                failure: (_) => Center(
                      child: Text(_.reason),
                    ));
          },
        ),
      ),
    );
  }
}

class _AppOption {
  final String label;
  final Icon icon;
  const _AppOption({
    required this.label,
    required this.icon,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _AppOption && other.label == label && other.icon == icon;
  }

  @override
  int get hashCode => label.hashCode ^ icon.hashCode;

  @override
  String toString() => '_AppOption(label: $label, icon: $icon)';
}
