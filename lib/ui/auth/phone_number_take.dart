import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mac_bro_test/controller/auth/auth_controller.dart';
import 'package:mac_bro_test/controller/main/profile/profile_controller.dart';
import 'package:mac_bro_test/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:mac_bro_test/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:mac_bro_test/routes/app_routes.dart';
import 'package:mac_bro_test/ui/auth/registration_page.dart';
import 'package:mac_bro_test/ui/main/main/main_page.dart';
import '../../core/custom_widgets/custom_button/custom_button.dart';
import '../../core/custom_widgets/text_fields/custom_masked.dart';
import '../../core/custom_widgets/text_fields/custom_text_field.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_style.dart';
import '../../core/theme/app_utils.dart';

class PhoneNumberTakePage extends GetView<AuthController> {
  String? passCode;
  String? name;
  String? surname;
  String? password;
  PhoneNumberTakePage({Key? key, this.passCode, this.password, this.name, this.surname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 180;
    TextEditingController passwordController = TextEditingController();
    return GetBuilder<AuthController>(builder: (ctr) {
      return Scaffold(
        appBar: SampleAppBar(
          title: 'login'.tr,
        ),
        body: ModalProgressHUD(
          inAsyncCall: ctr.isLoading,
          child: Container(
            padding: AppUtils.kAllPadding16,
            child: Form(
              key: formKey,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: AppUtils.kAllPadding16,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: AppUtils.kBorderRadius8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "enter_sms_code".tr,
                          style: AppTextStyles.appTitleSearch,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: CustomTextField(
                            autoFillHints: AutofillHints.password,
                            obscureText: true,
                            validator: (value) {

                              if(value != null && value.length != 6){
                                return 'error_otp'.tr;
                              } else {
                                ctr.createUserConfirm(passwordController.text.tr, passCode);
                                if(ctr.accessToken ==null) {
                                  return 'error_otp'.tr;
                                } else {
                                  return null;
                                }
                              }
                            },
                            inputFormatters: [
                              MaskedTextInputFormatter(
                                mask: '######',
                                separator: " ",
                              ),
                              FilteringTextInputFormatter.allow(
                                RegExp('[0-9]'),
                                replacementString: ' ',
                              ),
                            ],
                            keyboardType: TextInputType.number,
                            hintText: 'enter_sms_code'.tr,
                            controller: passwordController,
                            autoFocus: false,
                            showError: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.blue, width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            fillColor: AppColors.bgColor,
                            contentPadding: AppUtils.kAllPadding12,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "submit".tr,
                              style: AppTextStyles.appTitleSearchBlue,
                            ),
                            CountdownTimer(
                              endTime: endTime,
                              widgetBuilder: (_, CurrentRemainingTime? time) {
                                if (time == null) {
                                  return const Text('0:0', style: AppTextStyles.appTitleSearch,);
                                }
                                return Text(
                                  '${time.min ?? 0} : ${time.sec} ', style: AppTextStyles.appTitleSearch,);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                    borderRadius: AppUtils.kBorderRadius8,
                    color: AppColors.blue,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        if(ctr.isReg) {
                          await ctr.createUser(
                            name?? '',
                            surname ?? '',
                            ctr.parsePhoneNumber(
                                password ?? ''),
                            ctr.accessToken,
                          );
                        }
                        Get.offAllNamed(AppRoutes.main);
                        // ctr.createUserConfirm(passwordController.text.tr);
                      }

                    },
                    child: Text(
                      "login".tr,
                      style: AppTextStyles.loginButtonTitle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
