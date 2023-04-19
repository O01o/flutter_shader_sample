import 'dart:ui' as ui;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class CellularScreen extends StatefulWidget {
  const CellularScreen({super.key});

  @override
  State<CellularScreen> createState() => _CellularScreenState();
}

class _CellularScreenState extends State<CellularScreen> {
  
  Stream<double> timeCounter() async* {
    double time = 0;
    
    while (true) {
      time += 0.1;
      await Future.delayed(const Duration(milliseconds: 100));
      yield time;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: timeCounter(),
        builder: (BuildContext context, AsyncSnapshot time) => ShaderBuilder(
          assetKey: "shaders/worley_noise.frag",
          child: SizedBox(width: size.width, height: size.height,),
          (context, shader, child) {
            return AnimatedSampler(
              (ui.Image image, Size size, Canvas canvas) { 
                shader.setFloat(0, time.data);
                shader.setFloat(1, size.width);
                shader.setFloat(2, size.height);
                canvas.drawPaint(Paint()..shader = shader);
              }, 
              child: child!
            );
          }
        )
      )
    );
  }
}