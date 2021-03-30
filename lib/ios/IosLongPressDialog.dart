import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosLongPressDialog extends StatefulWidget {
  @override
  _IosLongPressDialogState createState() => _IosLongPressDialogState();
}

class _IosLongPressDialogState extends State<IosLongPressDialog> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: CupertinoContextMenu(
              child: Container(
                child: Image.network(
                    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3355464299,584008140&fm=26&gp=0.jpg"),
              ),
              actions: <Widget>[
                CupertinoContextMenuAction(
                  child: const Text('关闭按钮1号'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoContextMenuAction(
                  child: const Text('关闭按钮2号'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
