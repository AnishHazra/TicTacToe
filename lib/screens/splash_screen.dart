import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/screens/home_screen.dart';

class IntroGame extends StatefulWidget {
  const IntroGame({super.key});

  @override
  State<IntroGame> createState() => _IntroGameState();
}

class _IntroGameState extends State<IntroGame>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const HomePage(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.blueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image/Logo.png",
              fit: BoxFit.contain,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
