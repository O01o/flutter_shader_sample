import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import 'dart:ui' as ui;

import 'widgets/home_screen.dart';

void main() async {
  final ui.FragmentProgram program = await ui.FragmentProgram.fromAsset('sample.frag');

  runApp(
    ProviderScope(
      child: MyApp(program: program),
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key, required this.program});

  final ui.FragmentProgram program;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashFactory: ShaderInkFeatureFactory(program, (
          shader, {
            required double animation, 
            required Color color, 
            required Offset position, 
            required Size referenceBoxSize, 
            required double targetRadius, 
            required TextDirection textDirection
          }) { 
            shader.setFloat(0, animation);
            shader.setFloat(1, color.red / 255.0 * color.opacity);
            shader.setFloat(2, color.green / 255.0 * color.opacity);
            shader.setFloat(3, color.blue / 255.0 * color.opacity);
            shader.setFloat(4, color.opacity);
            shader.setFloat(5, targetRadius);
            shader.setFloat(6, position.dx);
            shader.setFloat(7, position.dy);
          }
        )
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

