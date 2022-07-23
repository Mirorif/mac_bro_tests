import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/custom_widgets/custom_button/custom_button.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_style.dart';

class InternetConnectionPage extends StatefulWidget {
  const InternetConnectionPage({Key? key}) : super(key: key);

  @override
  InternetConnectionPageState createState() => InternetConnectionPageState();
}

class InternetConnectionPageState extends State<InternetConnectionPage> {
  bool _isLoading = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result != ConnectivityResult.none) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('no_internet_access'.tr, style: AppTextStyles.noInternetTitle),
              const SizedBox(height: 12),
              Text(
                'check_your_internet_connection'.tr,
                style: AppTextStyles.noInternetSubTitle,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 4,),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.all(12),
          child: CustomButton(
            color: AppColors.blue,
            height: 50,
            onTap: () async {
              setState(() {
                _isLoading = true;
              });
              await Future.delayed(const Duration(milliseconds: 300));
              var connectivityResult = await Connectivity().checkConnectivity();
              setState(() {
                _isLoading = false;
              });
              if (connectivityResult != ConnectivityResult.none) {
                if (!mounted) return;
                Navigator.of(context).pop();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: _isLoading,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0, left: 12),
                    child: Theme(
                      data: ThemeData(
                        cupertinoOverrideTheme: const CupertinoThemeData(
                          brightness: Brightness.dark,
                        ),
                      ),
                      child: const CupertinoActivityIndicator(
                        radius: 12,
                        animating: true,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: _isLoading ? 36 : 0),
                      child: Text(
                        'try_again'.tr,
                        style: const TextStyle(
                          color: AppColors.white,
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
