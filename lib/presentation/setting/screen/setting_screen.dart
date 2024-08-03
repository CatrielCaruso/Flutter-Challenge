import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:flutter_challenge/presentation/setting/bloc/setting_bloc/setting_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingBlocRead = context.read<SettingBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Change Mode:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ToggleSwitch(
                minWidth: 90.0,
                minHeight: 70.0,
                initialLabelIndex: settingBlocRead.state.isLight ? 1 : 0,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                icons: const [
                  FontAwesomeIcons.lightbulb,
                  FontAwesomeIcons.solidLightbulb,
                ],
                iconSize: 30.0,
                activeBgColors: const [
                  [Colors.black45, Colors.black],
                  [Colors.yellow, Colors.orange]
                ],
                animationDuration: 100,
                animate:
                    true, // with just animate set to true, default curve = Curves.easeIn
                curve: Curves
                    .easeIn, // animate must be set to true when using custom curve
                onToggle: (index) {
                  if (index == 0) {
                    settingBlocRead.add(const ModeEventChange(false));
                    return;
                  }

                  if (index == 1) {
                    settingBlocRead.add(const ModeEventChange(true));
                    return;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
