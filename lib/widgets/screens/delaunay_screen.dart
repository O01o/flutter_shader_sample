import 'dart:ui' as ui;
import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:flutter_shader_sample/widgets/custom_widgets/delaunay_painter.dart';

class DelaunayScreen extends StatefulWidget {
  const DelaunayScreen({super.key});

  @override
  State<DelaunayScreen> createState() => _DelaunayScreenState();
}

class _DelaunayScreenState extends State<DelaunayScreen> {

  void DelaunayTriangulation() {

  }
  
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

    int count = 10;
    List<Offset> nodes = [];
    for (int i=0; i<count; i++) {
      double dx = math.Random().nextDouble() * size.width;
      double dy = math.Random().nextDouble() * size.height;
      nodes.add(Offset(dx, dy));
    }

    print("node length: ${nodes.length}");
    for (var node in nodes) { 
      print("${node.dx}, ${node.dy}");
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomPaint(
        painter: DelaunayPainter(nodes: nodes),
      ),
      /*
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
      */
    );
  }
}