import 'package:api_pattern/modules/test/Providers/obj_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => SecondPageProvider(context),
        child: const _SecondPage(),
      );
}

class _SecondPage extends StatelessWidget {
  const _SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select<SecondPageProvider, bool>((value) => value.isLoading);
    return Scaffold(
      body: Center(
        child: (isLoading)
            ? const CircularProgressIndicator()
            : Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
      ),
    );
  }
}
