import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class Custom3dObjectsScreen extends StatefulWidget {

  const Custom3dObjectsScreen({Key? key}) : super(key: key);

  @override
  State<Custom3dObjectsScreen> createState() => _Custom3dObjectsScreenState();
}
class NodeWithAnchor {
  final ARNode node;
  final ARAnchor anchor;
  final String nodeName;

  NodeWithAnchor(this.node, this.anchor, this.nodeName);
}

class _Custom3dObjectsScreenState extends State<Custom3dObjectsScreen>
{
  ARSessionManager? sessionManager;
  ARObjectManager? objectManager;
  ARAnchorManager? anchorManager;
  List<ARNode> allNodes = [];
  List<ARAnchor> allAnchor = [];
  Map<String, ARAnchor> nodeAnchorMap = {};
  List<int> deletion = [0,2];

  whenARViewCreated
      (
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager,
      )
  {
    sessionManager = arSessionManager;
    objectManager = arObjectManager;
    anchorManager = arAnchorManager;

    sessionManager!.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      showWorldOrigin: true,
      handlePans: true,
      handleRotation: true,
    );
    objectManager!.onInitialize();
    sessionManager!.onPlaneOrPointTap = whenPlaneDetectedAndUserTapped;
    objectManager!.onPanStart = whenOnPanStarted;
    objectManager!.onPanChange = whenOnPanChanged;
    objectManager!.onPanEnd = whenOnPanEnd;
    objectManager!.onRotationStart = whenOnRotationStarted;
    objectManager!.onRotationChange = whenOnRotationChanged;
    objectManager!.onRotationEnd = whenOnRotationEnded;
    objectManager!.onNodeTap = whenNodeTap;

  }
  void whenNodeTap(List<String> nodeNames) {
    if (nodeNames.isNotEmpty && allNodes.contains(nodeNames)) {
      String nodeName = nodeNames.first;
      print("nbhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh" + nodeName);// Assuming you only handle one node tap at a time
      removeSingleObject(nodeName);
    }
  }

  whenOnPanStarted(String node3dObjectName)
  {
    print("Started Panning Node = " + node3dObjectName);
  }
  whenOnPanChanged(String node3dObjectName)
  {
    print("Continued Panning Node = " + node3dObjectName);
  }
  whenOnPanEnd(String node3dObjectName, Matrix4 transform)
  {
    print("Ended Panning Node = " + node3dObjectName);
    final pannedNode = allNodes.firstWhere((node) => node.name == node3dObjectName);
  }
  whenOnRotationStarted(String node3dObjectName)
  {
    print("Start Rotating Node = " + node3dObjectName);
  }
  whenOnRotationChanged(String node3dObjectName)
  {
    print("Continued Rotating Node = " + node3dObjectName);
  }
  whenOnRotationEnded(String node3dObjectName , Matrix4 transform)
  {
    print("Ended Rotating Node = " + node3dObjectName);

    final pannedNode = allNodes.firstWhere((node) => node.name == node3dObjectName);
  }
  ARNode? currentNode;

  Future<void> whenPlaneDetectedAndUserTapped(List<ARHitTestResult> tapResults) async
  {

      var userHitTestResult = tapResults.firstWhere((userTap) => userTap.type == ARHitTestResultType.plane);
      if(userHitTestResult != null)
        {
          //new anchor
          var newplaneARAnchor = ARPlaneAnchor(transformation: userHitTestResult.worldTransform);

          bool? isAnchorAdded = await anchorManager!.addAnchor(newplaneARAnchor);

          if(isAnchorAdded!)
            {
              allAnchor.add(newplaneARAnchor);

              // new node
              var nodeNew3dObjects = ARNode(
                  type: NodeType.webGLB,  //.glb 3d model best size to keep the file type is between 10mb to 20mb
                  uri: "https://firebasestorage.googleapis.com/v0/b/my-3d-models-90061.appspot.com/o/free_bmw_m3_e30%20(1).glb?alt=media&token=dcbcd582-2152-4333-b9c8-750ac17b17e7",
                  scale: vector64.Vector3(0.2,0.2,0.2),
                  position: vector64.Vector3(0,0,0),
                  rotation: vector64.Vector4(1.0,0,0,0),

              );

              bool? isNewNodeAddedToNewAnchor = await objectManager!.addNode(nodeNew3dObjects,planeAnchor: newplaneARAnchor);

              if(isNewNodeAddedToNewAnchor!)
              {
                allNodes.add(NodeWithAnchor(nodeNew3dObjects, newplaneARAnchor, nodeNew3dObjects.name) as ARNode);
                nodeAnchorMap[nodeNew3dObjects.name] = newplaneARAnchor;
              }
              else
                {
                  sessionManager!.onError("Attaching Node to Anchor Failed.");
                }
            }
          else
            {
              sessionManager!.onError("Adding Anchor Failed.");
            }
        }
  }
  Future<void> removeEveryObject() async
  {
    print("parbhat" + allAnchor.toString());
    for(int i =0;i<allAnchor.length;i++){
      if(deletion.contains(i)){
        anchorManager!.removeAnchor(allAnchor[i]);
      }
    }
    print(allAnchor.length);
    // allAnchor.forEach((eachAnchor)
    // {
    //
    //   anchorManager!.removeAnchor(eachAnchor);
    //
    // });
    // allAnchor = [];
  }
  // Future<void> removeSingleObject(List<ARHitTestResult> tapResults) async {
  //   var userHitTestResult =
  //   tapResults.firstWhere((userTap) => userTap.type == ARHitTestResultType.point);
  //   if (userHitTestResult != null) {
  //     // Find the anchor associated with the tapped 3D model
  //     ARAnchor? associatedAnchor = nodeAnchorMap[userHitTestResult];
  //
  //     if (associatedAnchor != null) {
  //       anchorManager!.removeAnchor(associatedAnchor);
  //       nodeAnchorMap.remove(userHitTestResult);
  //       print("Removed the 3D model associated with the anchor.");
  //     } else {
  //       print("No anchor found for the tapped 3D model.");
  //     }
  //   }
  // }

  // void removeSingleObject(String nodeName) {
  //   // Implement the logic to remove a single 3D object here
  //   if (allNodes.isNotEmpty) {
  //     ARNode nodeToRemove = allNodes.removeLast();
  //     ARAnchor? associatedAnchor = nodeAnchorMap[nodeToRemove.name];
  //     if (associatedAnchor != null) {
  //       anchorManager!.removeAnchor(associatedAnchor);
  //       nodeAnchorMap.remove(nodeToRemove.name);
  //       print("Removed the 3D model associated with the anchor.");
  //     } else {
  //       print("No anchor found for the 3D model.");
  //     }
  //   } else {
  //     print("No 3D models to remove.");
  //   }
  // }
  void removeSingleObject(String nodeName) {
    if (nodeAnchorMap.containsKey(nodeName)) {
      ARAnchor associatedAnchor = nodeAnchorMap[nodeName]!;
      anchorManager!.removeAnchor(associatedAnchor);
      nodeAnchorMap.remove(nodeName);
      allNodes.removeWhere((node) => node.name == nodeName);
      print("Removed the 3D model associated with the anchor.");
    } else {
      print("No anchor found for the 3D model.");
    }
  }



  @override
  void dispose()
  {
    super.dispose();
    sessionManager!.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Custom 3d Objects"
        ),
        centerTitle: true,

      ),
      body: SizedBox(
        child: Stack(
          children: [
            ARView(
              planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
              onARViewCreated: whenARViewCreated,
            ),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: ElevatedButton(
                onPressed: ()
                {
                  removeEveryObject();
                },
                child: Text(
                  "Remove"
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
