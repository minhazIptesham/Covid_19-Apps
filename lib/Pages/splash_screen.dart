import 'dart:async';
import 'package:covid_19_with_api/Pages/world_state.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (BuildContext context) {
        return const world_state();
      })),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? index) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: index,
                );
              },
            child: Center(
              child: Image(
                image: const AssetImage('asset/image/splash screen.png'),height: size.height*.3,width: size.height*.3,
              ),
            ),
          ),
          SizedBox(height: size.height*.05,),
          Text("C O V I D - 19",style: TextStyle(fontSize: size.height*.03,fontWeight: FontWeight.bold,color: const Color(0xFF858484)),),
          Text("Tracker",style: TextStyle(fontSize: size.height*.03,fontWeight: FontWeight.bold,color: const Color(0xFFFE4003)),),
        ],
      ),
    );
  }
}
