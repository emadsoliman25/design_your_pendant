import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:circle_list/circle_list.dart';
import 'package:flutter/rendering.dart';
import 'final_design.dart';
import 'dart:ui' as ui;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _globalKey = GlobalKey();
  List<String> image1 = [
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
  ];
  List<String> image2 = [
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
    'assets/images/1-2.png',
  ];
  bool _pendant;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pendant = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("صممها"),
        centerTitle: true,
      ),
      body: _finalStack(),
    );
  }

  Widget _finalStack() {
    return Stack(
      children: <Widget>[
        _drawCircleStack(),
        _drawButtonsRow(),
        _drawShowDesignButton(),
      ],
    );
  }

  Widget _drawCircleStack() {
    return RepaintBoundary(
      key: _globalKey,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.76,
              height: MediaQuery.of(context).size.height * 0.77,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.grey), // border color
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: _chooseCircleList(_pendant),
          ),
        ],
      ),
    );
  }

  Widget _drawCircleList() {
    return CircleList(
      origin: Offset(0, 0),
      children: List.generate(20, (index) {
        return GestureDetector(
          onTap: () {
            _settingModalBottomSheet(context, index);
          },
          child: CircleAvatar(
            backgroundImage: ExactAssetImage(image1[index]),
            backgroundColor: Colors.grey.shade500,
            radius: 10,
          ),
        );
      }),
    );
  }

  Widget _drawBigCircleList() {
    return CircleList(
      origin: Offset(0, 0),
      children: List.generate(20, (index) {
        if (index == 5) {
          return GestureDetector(
            onTap: () {
              _settingModalBottomSheet(context, index);
            },
            child: CircleAvatar(
              backgroundImage: ExactAssetImage(image2[index]),
              backgroundColor: Colors.grey.shade500,
              radius: 30,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              _settingModalBottomSheet(context, index);
            },
            child: CircleAvatar(
              backgroundImage: ExactAssetImage(image2[index]),
              backgroundColor: Colors.grey.shade500,
              radius: 10,
            ),
          );
        }
      }),
    );
  }

  Widget _chooseCircleList(bool pendant) {
    if (pendant) {
      return _drawCircleList();
    } else {
      return _drawBigCircleList();
    }
  }

  Widget _drawButtonsRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RaisedButton(
            color: Colors.teal,
            child: Text(
              "بدون إستخدام القلاده",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                _pendant = true;
              });
            }),
        RaisedButton(
            color: Colors.teal,
            child: Text(
              "إستخدام القلاده",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                _pendant = false;
              });
            })
      ],
    );
  }

  Widget _drawShowDesignButton(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: RaisedButton(
            color: Colors.teal,
            child: Text('عرض الصوره',
                style: TextStyle(
                  color: Colors.white,
                )),
            onPressed: () async {

              var b = await _capturePng();
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return FinalDesign(b);
              }));
            },
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context, int position) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_pendant) {
                        image1.insert(position, 'assets/images/1.png');
                      } else {
                        image2.insert(position, 'assets/images/1.png');
                      }
                    });
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundImage: ExactAssetImage('assets/images/1.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_pendant) {
                        image1.insert(position, 'assets/images/2.png');
                      } else {
                        image2.insert(position, 'assets/images/2.png');
                      }
                    });
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundImage: ExactAssetImage('assets/images/2.png'),
                  ),
                ),
              ],
            ),
          );
        });
  }

  // ignore: missing_return
  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
      _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      // ignore: unused_local_variable
      var bs64 = base64Encode(pngBytes);

      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }
  }
}
