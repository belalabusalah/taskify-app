import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle title(Color color) => TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: color,
  );

  static TextStyle subtitle(Color color) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle body(Color color) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: color,
  );

  static TextStyle caption(Color color) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

class AppText extends StatelessWidget {
  final String text;
  final TextStyle Function(Color color)? styleBuilder;

  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText(
      this.text, {
        super.key,
        this.styleBuilder,
        this.color,
        this.textAlign,
        this.maxLines,
        this.overflow,
      });

  @override
  Widget build(BuildContext context) {
    final defaultColor =
        Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;

    final resolvedColor = color ?? defaultColor;

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: (styleBuilder ?? AppTextStyles.body)(resolvedColor),
    );
  }

  // 🔥 Factory constructors
  factory AppText.title(String text, {Color? color, TextAlign? textAlign}) {
    return AppText(
      text,
      styleBuilder: AppTextStyles.title,
      color: color,
      textAlign: textAlign,
    );
  }

  factory AppText.subtitle(String text, {Color? color, TextAlign? textAlign}) {
    return AppText(
      text,
      styleBuilder: AppTextStyles.subtitle,
      color: color,
      textAlign: textAlign,
    );
  }

  factory AppText.body(String text,
      {Color? color, TextAlign? textAlign, int? maxLines}) {
    return AppText(
      text,
      styleBuilder: AppTextStyles.body,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }

  factory AppText.caption(String text, {Color? color, TextAlign? textAlign}) {
    return AppText(
      text,
      styleBuilder: AppTextStyles.caption,
      color: color,
      textAlign: textAlign,
    );
  }
}