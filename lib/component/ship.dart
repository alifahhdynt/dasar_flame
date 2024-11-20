import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent with TapCallbacks {
  late Vector2 tujuan;
  late Vector2 arah;
  double speed = 3.0;

  @override
  Ship() {
    arah = Vector2(0, 0);
    tujuan = position;
  }

  void setTujuan(DragUpdateInfo info) {
    tujuan = info.eventPosition.global;
    lookAt(
        tujuan); //kapal berputar mengikuti mouse, kapal berhenti di mouse berhenti
    angle += pi;
    arah = tujuan - position;
    arah = arah.normalized();
  }

  @override
  Future<void> onLoad() async {
    //gabisa gerak
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
    position = Vector2(100, 100);
    angle = -pi / 2;
    // size = Vector2(10,  //gambarnya mengecil, jika nilai x nya semakin kecil maka gambar akan gepeng atas
    //     50); //gambarnya mengecil, jika nilai y nya semakin kecil maka gambar akan gepeng samping
    // scale = Vector2(
    //     15, //jika nilai x makin besar gambar akan melebar ke atas
    //     8); //jika nilai y makin besar gambar akan melebar ke samping
    anchor = Anchor.center; //titik awal dimana gambar akan bergerak
  }

  // @override
  // void update(double dt) {
  //   //update bisa gerak
  //   position.add(Vector2(0, 0));

  //   super.update(dt);
  // }

  @override
  // void onTapDown(TapDownEvent event) {
  //   position += Vector2(0,
  //       10); //jika diklik di objek maka objek akan bergerak ke bawah, jika diluar objek, objek tdk bergerak
  // }
  void update(double dt) {
    if ((tujuan - position).length < speed) {
      position = tujuan;
      arah = Vector2(0, 0);
    } // agar objek mengikuti mouse
    position.add(arah * speed);
    super.update(dt);
  }
}
