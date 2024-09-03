import 'package:air_bnb/business_logic/bottom_navigation_screen/bottom_navigation_screen_bloc.dart';
import 'package:air_bnb/business_logic/explore_screen/explore_screen.dart';
import 'package:air_bnb/screens/log_in_screen.dart';
import 'package:air_bnb/screens/trips_screen.dart';
import 'package:air_bnb/screens/wish_lists_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/inbox_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationScreenBloc(),
      child: const BottomNavigationScreen(),
    );
  }
}

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final homeScreen = [
    const ExploreScreenAddBloc(),
    const WishListsScreen(),
    const TripsScreen(),
    const InboxScreen(),
    const LogInScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationScreenBloc, BottomNavigationScreenState>(
        builder: (context, state) {
      return Scaffold(
        body: IndexedStack(
          index: state.tabIndex,
          children: homeScreen,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _bottomNavigationBarItem,
          currentIndex: state.tabIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            BlocProvider.of<BottomNavigationScreenBloc>(context)
                .add(TabChange(tabIndex: index));
          },
        ),
      );
    });
  }
}

List<BottomNavigationBarItem> _bottomNavigationBarItem = const [
  BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Explore',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_border),
    label: 'Wishlists',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.navigation),
    label: 'Trips',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.messenger_outline),
    label: 'Explore',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_2_rounded),
    label: 'Log in',
  ),
];
