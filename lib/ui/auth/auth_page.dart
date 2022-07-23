import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mac_bro_test/controller/auth/auth_controller.dart';
import 'package:mac_bro_test/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:mac_bro_test/core/custom_widgets/custom_button/custom_button.dart';
import 'package:mac_bro_test/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:mac_bro_test/core/custom_widgets/text_fields/custom_phone_text_field.dart';
import 'package:mac_bro_test/core/theme/app_colors.dart';
import 'package:mac_bro_test/core/theme/app_text_style.dart';
import 'package:mac_bro_test/core/theme/app_utils.dart';
import 'package:mac_bro_test/ui/auth/phone_number_take.dart';
import 'package:mac_bro_test/ui/auth/registration_page.dart';
import '../../core/custom_widgets/text_fields/custom_masked.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return GetBuilder<AuthController>(builder: (ctr) {
      return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: SampleAppBar(
          title: "login".tr,
        ),
        body: ModalProgressHUD(
          inAsyncCall: ctr.isLoading,
          child: Container(
            padding: AppUtils.kAllPadding16,
            child: Form(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "phone_number".tr,
                          style: AppTextStyles.appTitleSearch,
                        ),
                        const SizedBox(height: 8),
                        CustomPhoneTextField(
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
                          required: true,
                          hintText: 'phone_number'.tr,
                          controller: ctr.phoneNumberController,
                          autoFocus: false,
                          keyboardType: TextInputType.number,
                          showError: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.blue, width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          fillColor: AppColors.bgColor,
                          contentPadding: AppUtils.kAllPadding12,
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    borderRadius: AppUtils.kBorderRadius8,
                    color: AppColors.blue,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await ctr.createUserExists(ctr.parsePhoneNumber(
                            ctr.phoneNumberController.text.tr));
                        if (ctr.isActive) {
                          await ctr.createUserGenerate(
                              ctr.parsePhoneNumber(
                                  ctr.phoneNumberController.text.tr),
                              ctr.autoPassword);
                          Get.off(
                            () => PhoneNumberTakePage(
                              passCode: ctr.passcodeToken,
                            ),
                          );
                        } else {
                          Get.off(() => RegistrationPage());
                        }
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
