import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppbar({super.key, this.title, this.action, this.hideBack = false, this.backgroundColor});
  final Widget? title;
  final Widget? action;
  final bool hideBack;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text(''),
      actions: [action ?? const SizedBox()],
      leading: hideBack ? null : IconButton(
        icon:Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.isDarkMode ? Colors.white.withOpacity(0.03): Colors.black.withOpacity(0.04),
          ),
          child:  Icon(Icons.arrow_back_ios_new, size: 15,color: context.isDarkMode ? Colors.white : Colors.black,),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
