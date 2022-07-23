

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/png/ic_empty.png', fit: BoxFit.cover,),
    );
  }
}
