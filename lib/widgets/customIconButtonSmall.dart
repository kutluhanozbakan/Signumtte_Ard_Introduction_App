import 'package:flutter/material.dart';

class AppIconButtonSm extends StatefulWidget {
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final Color iconColor;
  final IconData icon;
  final bool disable;
  const AppIconButtonSm(
      {Key? key,
      this.backgroundColor = const Color(0xFFcc4444),
      this.onPressed,
      this.iconColor = Colors.white,
      this.disable = false,
      this.icon = Icons.delete})
      : super(key: key);

  @override
  State<AppIconButtonSm> createState() => _AppIconButtonSmState();
}

class _AppIconButtonSmState extends State<AppIconButtonSm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: widget.disable ? Colors.grey : widget.backgroundColor,
      ),
      child: IconButton(
        onPressed: !widget.disable ? widget.onPressed ?? () {} : () {},
        icon: Icon(widget.icon),
        color: widget.iconColor,
      ),
    );
  }
}
