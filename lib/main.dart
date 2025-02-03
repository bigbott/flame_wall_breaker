
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_wall_breaker/game/widgets/game_app.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FlameAudio.bgm.initialize();
  await FlameAudio.audioCache.loadAll(['brick_collision.wav', 
                                          'wall_collision.wav', 'bg.wav']);
  runApp(const GameApp());
}

