import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/svg_icon_button.dart';

class SideBarMenuItem extends StatefulWidget {
  const SideBarMenuItem({
    Key? key,
    required this.text,
    this.icon,
    this.svgPath,
    this.isActive = false,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final String? svgPath;
  final bool isActive;
  final Function() onPressed;

  @override
  _SideBarMenuItemState createState() => _SideBarMenuItemState();
}

class _SideBarMenuItemState extends State<SideBarMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 250),
      color: isHovered ? Colors.white.withOpacity(0.1) : Colors.transparent,
      child: Material(
        color: widget.isActive
            ? Colors.white.withOpacity(0.1)
            : Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : () => widget.onPressed(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child: Row(
                children: [
                  if (widget.icon != null) ...[
                    Icon(widget.icon, color: Colors.white.withOpacity(0.8)),
                    const SizedBox(width: 10),
                  ],
                  if (widget.svgPath != null) ...[
                    SvgIconButton(
                      path: widget.svgPath!,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    const SizedBox(width: 10),
                  ],
                  Expanded(
                    child: Text(
                      widget.text,
                      style: textStyleBody.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: kNormalFontSized,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
