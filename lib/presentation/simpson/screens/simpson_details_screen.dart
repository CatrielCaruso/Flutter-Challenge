import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter_challenge/core/helper/wifi_helper.dart';
import 'package:flutter_challenge/core/theme/app_styles.dart';
import 'package:flutter_challenge/domain/model/simpson_model.dart';

class SimpsonDetailsScreen extends StatelessWidget {
  final SimpsonModel simpson;
  final Function? onTap;

  const SimpsonDetailsScreen({
    super.key,
    required this.simpson,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppStyles.gray200Color,
              foregroundColor: WifiHelper.connectivityResult
                      .contains(ConnectivityResult.none)
                  ? null
                  : AppStyles.whiteColor,
              flexibleSpace: Padding(
                padding: WifiHelper.connectivityResult
                        .contains(ConnectivityResult.none)
                    ? const EdgeInsets.symmetric(vertical: 0)
                    : const EdgeInsets.symmetric(vertical: 5),
                child: Hero(
                    tag: simpson.id!,
                    child: WifiHelper.connectivityResult
                            .contains(ConnectivityResult.none)
                        ? Image.asset(
                            'assets/img/simpson_family2.jpg',
                            fit: BoxFit.cover,
                          )
                        : Image.network(simpson.image)),
              ),
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      simpson.character,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Quote:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      simpson.quote,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
