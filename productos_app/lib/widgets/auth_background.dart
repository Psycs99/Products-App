import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      //color: Colors.red,
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          const _purpleBox(),
          const _headerIcon(),
          child,
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _headerIcon extends StatelessWidget {
  const _headerIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 50),
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _purpleBox extends StatelessWidget {
  const _purpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      //color: Colors.indigo,
      decoration: _purpleBackground(),
      child: Stack(
        children: const [
          Positioned(
            top: 150,
            left: 10,
            child: _Bubble(),
          ),
          Positioned(
            top: 10,
            left: 80,
            child: _Bubble(),
          ),
          Positioned(
            top: 70,
            left: 350,
            child: _Bubble(),
          ),
          Positioned(
            top: 200,
            left: 200,
            child: _Bubble(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 153, 1),
        Color.fromARGB(255, 100, 72, 224),
      ]));
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.1),
      ),
    );
  }
}
