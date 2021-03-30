import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosBottomSheet extends StatefulWidget {
  @override
  _IosBottomSheetState createState() => _IosBottomSheetState();
}

class _IosBottomSheetState extends State<IosBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: const Text('Title'),
                message: const Text('Message'),
                actions: [
                  CupertinoActionSheetAction(
                    child: const Text('Action One'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('Action Two'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          },
          child: Text('CupertinoActionSheet'),
        ),
      ),
    );
  }
}
