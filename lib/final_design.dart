import 'dart:typed_data';
import 'package:design_it/home.dart';
import 'package:flutter/material.dart';
class FinalDesign extends StatefulWidget {
  final Uint8List imageByte;

  FinalDesign(this.imageByte);

  @override
  _FinalDesignState createState() => _FinalDesignState();
}

class _FinalDesignState extends State<FinalDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("التصميم النهائي"),
        centerTitle: true,
      ),
      body: _drawFinalStack(),
    );
  }
  Widget _drawFinalStack(){
    return Stack(
      children: <Widget>[
        Positioned.fill(child: Image.memory(widget.imageByte)),
        _drawSingleRowButtons(),
      ],
    );
  }

  Widget _drawSingleRowButtons(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                color: Colors.teal,
                child: Text('تعديل',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              RaisedButton(
                color: Colors.teal,
                child: Text('انتهاء',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Home();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
