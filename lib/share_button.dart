import 'package:flutter/material.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  _ShareButtonState createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit:FlexFit.tight,
      child: ElevatedButton(
        onPressed: (){},
        child: const Icon(
          Icons.share,
        ),
        style:Theme.of(context).elevatedButtonTheme.style,
      ),
    );
  }
}
