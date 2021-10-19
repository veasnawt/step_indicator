import 'package:flutter/material.dart';
import 'package:step_indicator/step_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StepIndicator(
      currentStep: 0,
      count: 4,
      activeIndicatorColor: Colors.blue,
      activeLineColor: Colors.blue,
      enableStepTitle: true,
      indicatorBorderWidth: 2,
      stepTitles: ["Step 1", "Step 2", "Step 3", "Step 4"],
      stepTitleStyle: TextStyle(
        color: Colors.black,
      ),
    );
  }
}
