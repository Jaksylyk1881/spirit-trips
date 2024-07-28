import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const TitleRow({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (onTap != null)
          CupertinoButton(
            minSize: 29,
            padding: EdgeInsets.zero,
            onPressed: onTap,
            child: Text(
              'Посмотреть все',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
      ],
    );
  }
}
