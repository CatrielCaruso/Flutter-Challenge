import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter_challenge/core/helper/wifi_helper.dart';
import 'package:flutter_challenge/core/theme/app_styles.dart';
import 'package:flutter_challenge/domain/model/simpson_model.dart';
import 'package:flutter_challenge/presentation/simpson/bloc/simpson_bloc/simpson_bloc.dart';
import 'package:flutter_challenge/presentation/simpson/screens/simpson_details_screen.dart';

class SimpsonListScreen extends StatelessWidget {
  static String routeName = 'simpsonListScreen';
  const SimpsonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocConsumer<SimpsonBloc, SimpsonState>(
        builder: (context, state) {
          final state = context.watch<SimpsonBloc>().state;
          if (state is SimpsonInitial) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppStyles.lightGreen500Color,
              ),
            );
          } else if (state is SimpsonLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppStyles.lightGreen500Color,
              ),
            );
          } else if (state is SimpsonLoadded) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
              ),
              child: MasonryGridView.count(
                itemCount: state.simpsonList.length,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemBuilder: (context, index) {
                  if (index == 1) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        _SimpsonCardWidget(
                          character: state.simpsonList[index],
                        ),
                        if (index == state.simpsonList.length - 1)
                          const SizedBox(
                            height: 10,
                          )
                      ],
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _SimpsonCardWidget(
                        character: state.simpsonList[index],
                      ),
                      if (index == state.simpsonList.length - 1)
                        const SizedBox(
                          height: 10,
                        )
                    ],
                  );
                },
              ),
            );
          } else if (state is SimpsonError) {
            return const SizedBox();
          } else {
            return const SizedBox();
          }
        },
        listener: (BuildContext context, SimpsonState state) {
          if (state is SimpsonError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 1),
                content: SizedBox(
                  width: double.infinity,
                  child: Text(state.error),
                ),
              ),
            );
          }
        },
      )),
    );
  }
}

class _SimpsonCardWidget extends StatelessWidget {
  const _SimpsonCardWidget({
    required this.character,
  });

  final SimpsonModel character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SimpsonDetailsScreen(
            simpson: character,
          ),
        ),
      ),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          color: AppStyles.gray200Color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: AppStyles.gray500Color,
              spreadRadius: 0.1,
              blurRadius: 0.1,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Hero(
            tag: character.id!,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: FadeInImage(
                fit: BoxFit.contain,
                placeholder: const AssetImage('assets/img/simpson_title.png'),
                image: WifiHelper.connectivityResult
                        .contains(ConnectivityResult.none)
                    ? const AssetImage(
                        'assets/img/simpson_family2.jpg',
                      )
                    : NetworkImage(character.image),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
