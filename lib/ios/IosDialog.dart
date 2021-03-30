import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosDialog extends StatefulWidget {
  @override
  _IosDialogState createState() => _IosDialogState();
}

class _IosDialogState extends State<IosDialog> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: SizedBox(
          child: CupertinoButton(
            child: Text(
              '弹窗',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text("确认删除"),
                      content: Text('\n是否删除此条目？'),
                      actions: [
                        CupertinoDialogAction(
                          child: Text('确认'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text('取消'),
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            },
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }
}
