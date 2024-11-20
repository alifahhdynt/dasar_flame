import 'dart:async';
import 'dart:ui';
// import 'package:dasar_flame/component/asteroid.dart';
import 'package:dasar_flame/component/asteroid_spawner.dart';
import 'package:dasar_flame/component/bgParallaxComponent.dart';
import 'package:dasar_flame/component/ship.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
// import 'package:flame/components.dart';

class MyFlameGame extends FlameGame with PanDetector {
  late Ship s;
  late Bgparallaxcomponent bgParallax;
  // late Asteroid a;
  late AsteroidSpawner asp;

  @override
  FutureOr<void> onLoad() async {
    bgParallax = Bgparallaxcomponent();
    add(bgParallax);

    // Asteroid a = Asteroid();
    // add(a);

    asp = AsteroidSpawner();
    add(asp);

    s = Ship();
    add(s);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    // Set posisi tujuan kapal berdasarkan posisi global dari drag
    s.setTujuan(info);
  }
  // @override
  // void onTapDown(TapDownEvent event) {
  //   s.position.add(Vector2(10, 0));
  // }
  // void onPanUpdate(DragUpdateInfo info) {
  //   s.position = info.eventPosition.global; //ketika klik tahan maka objek akan berpindah dimana kita akan mengarahkan kursornya, di dalam/pun diluar objek
  // }

  @override
  void update(double dt) {
    bgParallax.changeSpeedBaseShip(s);
    super.update(dt);
  }

  @override
  Color backgroundColor() {
    return const Color(0xFF000045);
  }
}



//perbedaan antara jika TapCallbacks di letakkan di sprite maka ketika diklik di area luar objek tdk bergerak, dengan jika TapCallbacks di letakkan di file utama gim jika diklik di area luar objek, objek akan bergerak
