import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mac_bro_test/controller/auth/auth_controller.dart';
import 'package:mac_bro_test/controller/main/profile/profile_controller.dart';
import 'package:mac_bro_test/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:mac_bro_test/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:mac_bro_test/routes/app_routes.dart';
import 'package:mac_bro_test/ui/auth/phone_number_take.dart';
import 'package:mac_bro_test/ui/main/profile/profile_page.dart';
import '../../core/custom_widgets/custom_button/custom_button.dart';
import '../../core/custom_widgets/text_fields/custom_masked.dart';
import '../../core/custom_widgets/text_fields/custom_phone_text_field.dart';
import '../../core/custom_widgets/text_fields/custom_text_field.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_style.dart';
import '../../core/theme/app_utils.dart';

class RegistrationPage extends GetView<AuthController> {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return GetBuilder<AuthController>(builder: (ctr) {
      return Scaffold(
        appBar: SampleAppBar(
          title: 'Registration',
        ),
        body: ModalProgressHUD(
          inAsyncCall: ctr.isLoading,
          child: Container(
            padding: AppUtils.kAllPadding16,
            child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: formKey,
              child: Column(
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
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          "name".tr,
                          style: AppTextStyles.appTitleSearch,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                          child: CustomTextField(
                            validator: (value) {
                              if (value != null && value.length < 3) {
                                return 'error_name'.tr;
                              } else {
                                return null;
                              }
                            },
                            hintText: 'name'.tr,
                            controller: ctr.firstnameController,
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
                        Text(
                          "surname".tr,
                          style: AppTextStyles.appTitleSearch,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                          child: CustomTextField(
                            validator: (value) {
                              if (value != null && value.length < 3) {
                                return 'error_surname'.tr;
                              } else {
                                return null;
                              }
                            },
                            hintText: 'surname'.tr,
                            controller: ctr.lastnameController,
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
                        Text(
                          "phone_number".tr,
                          style: AppTextStyles.appTitleSearch,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CustomPhoneTextField(
                            validator: (value) {
                              if (value != null && value.length != 12) {
                                return 'error_phone'.tr;
                              } else {
                                return null;
                              }
                            },
                            inputFormatters: [
                              MaskedTextInputFormatter(
                                mask: '## ### ## ##',
                                separator: " ",
                              ),
                              FilteringTextInputFormatter.allow(
                                RegExp('[0-9]'),
                                replacementString: ' ',
                              ),
                            ],
                            keyboardType: TextInputType.number,
                            hintText: 'phone_number'.tr,
                            controller: ctr.phoneNumberController,
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
                      ],
                    ),
                  ),
                  CustomButton(
                    borderRadius: AppUtils.kBorderRadius8,
                    color: AppColors.blue,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await ctr.createUserRegister(ctr.parsePhoneNumber(
                            ctr.phoneNumberController.text.tr));
                        await ctr.createUserGenerate(
                            ctr.parsePhoneNumber(
                                ctr.phoneNumberController.text.tr),
                            ctr.autoPassword);
                        ctr.isRegistration(true);
                        Get.off(
                          () => PhoneNumberTakePage(
                            passCode: ctr.passcodeToken,
                            name: ctr.firstnameController.text.tr,
                            surname: ctr.lastnameController.text.tr,
                            password: ctr.phoneNumberController.text.tr,
                          ),
                        );
                      }
                    },
                    child: Text(
                      "registration".tr,
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
