import 'package:flutter/material.dart';
import 'package:notes/router.dart';

void main() {
  runApp(Notes(
    router: AppRouter(),
  ));
}

class Notes extends StatelessWidget {
  final AppRouter? router;

  const Notes({Key? key, this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router!.generateRoute,
    );
  }
}
