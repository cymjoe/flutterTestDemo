import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosFullDialog extends StatefulWidget {
  @override
  _IosFullDialogState createState() => _IosFullDialogState();
}

class _IosFullDialogState extends State<IosFullDialog>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool show = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    super.initState();
    setState(() {
      show=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stackoverflow playground'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              CupertinoFullscreenDialogTransition(
                primaryRouteAnimation: _animationController,
                secondaryRouteAnimation: _animationController,
                linearTransition: false,
                child: Center(
                  child: Container(
                    color: Colors.blueGrey,
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
              Offstage(
                offstage: !show,
                child: CupertinoActivityIndicator(
                  radius: 20,
                  animating: show,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.not_started),
                      onPressed: () {
                        setState(() {
                          show = !show;
                        });
                      }),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () => _animationController.forward(),
                    child: Text('Forward'),
                  ),
                  RaisedButton(
                    onPressed: () => _animationController.reverse(),
                    child: Text('Reverse'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
