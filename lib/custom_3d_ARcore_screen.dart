import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';

class Custom3dARCore extends StatefulWidget {
  const Custom3dARCore({Key? key}) : super(key: key);

  @override
  State<Custom3dARCore> createState() => _Custom3dARCoreState();
}

class _Custom3dARCoreState extends State<Custom3dARCore> {
  whenARCoreViewCreated(ArCoreController arCoreController)
  {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3d Objects"),
        centerTitle: true,

      ),
      body: SizedBox(
        child: Stack(
          children: [
            ArCoreView(
              enablePlaneRenderer: true,
              onArCoreViewCreated: whenARCoreViewCreated,
            )
          ],
        ),
      ),
    );
  }
}
