import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_challenge/core/helper/wifi_helper.dart';
import 'package:flutter_challenge/core/theme/app_styles.dart';
import 'package:flutter_challenge/presentation/bottom_navigation_bar/bloc/bloc_navigation/navigation_bloc.dart';
import 'package:flutter_challenge/presentation/simpson/bloc/simpson_bloc/simpson_bloc.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  static String routeName = 'bottomNavigationBarScreen';
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  void initState() {
    _isConnected();

    super.initState();
  }

  Future<void> _isConnected() async {
    if (WifiHelper.connectivityResult.contains(ConnectivityResult.mobile)) {
      // I am connected to a mobile network.
      context.read<SimpsonBloc>().add(GetSimponsList());
    } else if (WifiHelper.connectivityResult
        .contains(ConnectivityResult.wifi)) {
      context.read<SimpsonBloc>().add(GetSimponsList());

      // I am connected to a network which is not in the above mentioned networks.
    } else if (WifiHelper.connectivityResult
        .contains(ConnectivityResult.none)) {
      // I am not connected to any network.
      context.read<SimpsonBloc>().add(GetSimponsListDataBase());
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigationBlocWatch = context.watch<NavigationBloc>().state;
    return Scaffold(
      body: navigationBlocWatch
          .screens[navigationBlocWatch.selectedIndexNavigationBar],
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          color: Theme.of(context).colorScheme.primaryContainer,
          // color: Theme.of(context).brightness == Brightness.light
          //     ? AppStyles.whiteColor
          //     : Colors.black,
          boxShadow: const [
            BoxShadow(
              color: AppStyles.gray500Color,
              spreadRadius: 0.1,
              blurRadius: 0.1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => context
                      .read<NavigationBloc>()
                      .add(const NavigationEventChange(0)),
                  child: _NavigationBarItem(
                    isSelected:
                        navigationBlocWatch.selectedIndexNavigationBar == 0,
                    selectedIcon: Icons.people_alt,
                    unSelectedIcon: Icons.people_alt_outlined,
                    label: 'Home',
                    index: 0,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => context
                      .read<NavigationBloc>()
                      .add(const NavigationEventChange(1)),
                  child: _NavigationBarItem(
                    isSelected:
                        navigationBlocWatch.selectedIndexNavigationBar == 1,
                    selectedIcon: Icons.settings_applications,
                    unSelectedIcon: Icons.settings_applications_sharp,
                    label: 'Setting',
                    index: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final bool isSelected;
  final String label;
  final int index;
  const _NavigationBarItem(
      {required this.selectedIcon,
      required this.unSelectedIcon,
      required this.isSelected,
      required this.label,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          curve: Curves.linear,
          duration: const Duration(milliseconds: 250),
          padding: isSelected
              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 5)
              : const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color:
                isSelected ? AppStyles.lightGreen500Color : Colors.transparent,
          ),
          child: Icon(
            isSelected ? selectedIcon : unSelectedIcon,
            color: isSelected ? AppStyles.whiteColor : AppStyles.gray500Color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: AppStyles.gray500Color,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontFamily: AppStyles.fontFamilyFranklin,
          ),
        ),
      ],
    );
  }
}
