import 'package:flutter/material.dart';

class CustumIconButtonSm extends StatefulWidget {
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final Color iconColor;
  final IconData icon;
  final bool disable;
  const CustumIconButtonSm(
      {Key? key,
      this.backgroundColor = const Color(0xFFcc4444),
      this.onPressed,
      this.iconColor = Colors.white,
      this.disable = false,
      this.icon = Icons.delete})
      : super(key: key);

  @override
  State<CustumIconButtonSm> createState() => _CustumIconButtonSmState();
}

class _CustumIconButtonSmState extends State<CustumIconButtonSm> {
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
