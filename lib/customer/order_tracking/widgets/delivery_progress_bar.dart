import 'package:flutter/material.dart';

class DeliveryProgessBar extends StatefulWidget {
  const DeliveryProgessBar({super.key});

  @override
  State<DeliveryProgessBar> createState() => _DeliveryProgessBarState();
}

class _DeliveryProgessBarState extends State<DeliveryProgessBar>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Duration remainingTime;

  @override
  void initState() {
    super.initState();
    showProgress();
  }

  void showProgress() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        minutes: 1,
      ),
    )
      ..addListener(
        () {
          setState(() {});
        },
      )
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            setState(() {
              remainingTime = const Duration();
            });
          } else {
            setState(() {
              remainingTime = getRemainingTime();
            });
          }
        },
      );
    _controller.forward();
  }

  Duration getRemainingTime() {
    final elapsedTime = _controller.lastElapsedDuration;
    final timeLeft = _controller.duration! - (elapsedTime ?? Duration.zero);
    return timeLeft;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Delivery Status: ${remainingTime.inMinutes} minutes away",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            LinearProgressIndicator(
              value: _controller.value,
            ),
          ],
        ),
      ),
    );
  }
}
