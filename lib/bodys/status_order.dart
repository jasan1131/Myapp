import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class StatusOrder extends StatefulWidget {
  const StatusOrder({Key? key}) : super(key: key);

  @override
  State<StatusOrder> createState() => _StatusOrderState();
}

class _StatusOrderState extends State<StatusOrder> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          title: ShowTitle(title: 'สินค้าที่สั่ง'),
          content: Container(),
        ),
        Step(
          title: ShowTitle(title: 'เตรียมสินค้า'),
          content: Container(),
        ),
        Step(
          title: ShowTitle(title: 'จัดส่งสินค้า'),
          content: Container(),
        ),
        Step(
          title: ShowTitle(title: 'ยืนยันสินค้า'),
          content: Container(),
        ),
      ];
}
