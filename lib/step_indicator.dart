library step_indicator;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StepIndicator extends StatefulWidget {
  const StepIndicator({
    Key? key,
    required this.count,
    this.indicatorRadius = 30,
    required this.currentStep,
    this.indicatorColor = const Color(0xFFEEEEEE),
    this.activeIndicatorColor = const Color(0xFF00FF00),
    this.lineWidth = 80,
    this.lineHeight = 10,
    this.lineRadius = 20,
    this.lineColor = const Color(0xFFEEEEEE),
    this.activeLineColor = const Color(0xFF00FF00),
    this.indicatorBorderColor = const Color(0xFFFFFFFF),
    this.indicatorBorderWidth = 1,
    this.numberStyle = const TextStyle(color: Colors.black),
    this.activeNumberStyle = const TextStyle(color: Colors.white),
    this.lineSpacing = 1,
    this.stepTitles = const [],
    this.stepTitleStyle = const TextStyle(color: Colors.black),
    this.enableStepTitle = false,
  }) : super(key: key);

  final int count;
  final double indicatorRadius;
  final int currentStep;
  final Color indicatorColor;
  final Color activeIndicatorColor;
  final double lineWidth;
  final double lineHeight;
  final double lineRadius;
  final Color lineColor;
  final Color activeLineColor;
  final Color indicatorBorderColor;
  final double indicatorBorderWidth;
  final TextStyle numberStyle;
  final TextStyle activeNumberStyle;
  final double lineSpacing;
  final List<String> stepTitles;
  final bool enableStepTitle;
  final TextStyle stepTitleStyle;

  @override
  _StepIndicatorState createState() => _StepIndicatorState();
}

class _StepIndicatorState extends State<StepIndicator> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < widget.count; i++)
            Row(
              children: [
                SizedBox(
                  width: i > 0 ? widget.lineSpacing : 0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: widget.indicatorRadius,
                          width: widget.lineWidth,
                        ),
                        Positioned(
                          bottom: ((widget.indicatorRadius / 2) -
                              ((widget.indicatorRadius / 2) / 2)) +
                              ((widget.lineHeight / 2) / 2),
                          child: Container(
                            width: widget.lineWidth,
                            height: widget.lineHeight,
                            decoration: BoxDecoration(
                              color: widget.currentStep >= i
                                  ? widget.activeLineColor
                                  : widget.lineColor,
                              borderRadius: i == 0
                                  ? BorderRadius.only(
                                topLeft: Radius.circular(
                                  widget.lineRadius,
                                ),
                                bottomLeft: Radius.circular(
                                  widget.lineRadius,
                                ),
                              )
                                  : i == widget.count - 1
                                  ? BorderRadius.only(
                                topRight: Radius.circular(
                                  widget.lineRadius,
                                ),
                                bottomRight: Radius.circular(
                                  widget.lineRadius,
                                ),
                              )
                                  : BorderRadius.zero,
                            ),
                          ),
                        ),
                        Positioned(
                          left: (widget.lineWidth / 2) -
                              (widget.indicatorRadius / 2),
                          child: Container(
                            width: widget.indicatorRadius,
                            height: widget.indicatorRadius,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: widget.indicatorBorderColor,
                                width: widget.indicatorBorderWidth,
                              ),
                              color: widget.currentStep >= i
                                  ? widget.activeIndicatorColor
                                  : widget.indicatorColor,
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                (i + 1).toString(),
                                style: widget.currentStep >= i
                                    ? widget.activeNumberStyle
                                    : widget.numberStyle,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    widget.enableStepTitle
                        ? Text(
                      widget.stepTitles[i],
                      textAlign: TextAlign.center,
                      style: widget.stepTitleStyle,
                    )
                        : Container(),
                  ],
                ),
              ],
            )
        ],
      ),
    );
  }
}
