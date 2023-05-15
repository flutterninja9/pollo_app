import 'package:flutter/material.dart';
import 'package:pollo_education/presentation/Enterpreneur/view/enterpreneur_screen.dart';
import 'package:pollo_education/presentation/b2b/view/b2b_screen.dart';
import 'package:pollo_education/presentation/b2c/view/b2c_screen.dart';
import 'package:pollo_education/presentation/course/view/my_course_screen.dart';
import 'package:pollo_education/presentation/home/view/home_screen.dart';

class HomeScreenContainer extends StatefulWidget {
  static const routeName = '/home-section';
  const HomeScreenContainer({super.key});

  @override
  State<HomeScreenContainer> createState() => _HomeScreenContainerState();
}

class _HomeScreenContainerState extends State<HomeScreenContainer> {
  int currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> screens = [
    const HomeScreen(),
    const B2BScreen(),
    const B2CScreen(),
    const EnterpreneurScreen(),
    const MyCourseScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: changeIndex,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'B2B',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'B2C',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Enterpreneur',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Courses',
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
