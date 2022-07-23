import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_bro_test/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:mac_bro_test/core/custom_widgets/empty_page/empty_page.dart';

import '../../../controller/main/my_orders/my_orders_controller.dart';

class MyOrdersPage extends GetView<MyOrdersController> {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SampleAppBar(title: "basket".tr,),
      body: const EmptyPage(),
    );
  }
}
