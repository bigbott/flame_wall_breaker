import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame_wall_breaker/game/brick_breaker.dart';
import 'package:flutter/material.dart';


class Bat extends PositionComponent
    with DragCallbacks, HasGameReference<BrickBreaker> {
  Bat({
    required this.cornerRadius,
    required super.position,
    required super.size,
  }) : super(
          anchor: Anchor.center,
          children: [RectangleHitbox()],
        );

  final Radius cornerRadius;

  final _paint = Paint()
    ..color = const Color(0xff1e6091)
    ..style = PaintingStyle.fill;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size.toSize(),
          cornerRadius,
        ),
        _paint);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    try {
        position.x = (position.x + event.localDelta.x).clamp(0, game.width);
    } catch (e){
       print(e);
    }
   
  }

  void moveBy(double dx) {
    add(MoveToEffect(
      Vector2((position.x + dx).clamp(0, game.width), position.y),
      EffectController(duration: 0.1),
    ));
  }
}