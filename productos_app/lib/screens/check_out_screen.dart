import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens_export.dart';
import 'package:productos_app/services/services_export.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authServices.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return const Text('Espere');
            }
            Future.microtask(() {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => snapshot.data == ''
                          ? const LoginScreen()
                          : const HomeScreen(),
                      transitionDuration: const Duration(seconds: 0)));
            });
            return Container();
          },
        ),
      ),
    );
  }
}
