import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'app_styles.dart';

typedef FieldValidator = String? Function(String? data);

class SvgViewer extends StatelessWidget {
  final String svgPath;
  final double? height;
  final double? width;
  final Color? color;

  const SvgViewer(
      {Key? key,
      required this.svgPath,
      this.height,
      this.width,
      this.color = AppColor.whiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      allowDrawingOutsideViewBox: true,
      color: color,
      height: height ?? 18,
      width: width ?? 18,
    );
  }
}

class MyTextField extends StatelessWidget {
  final Color? fillColor;
  final String? labelText;
  final String? hintText;
  final Color? hintColor;
  final Color? labelColor;
  final String? prefixIcon;
  final String? suffixIcon;
  final Color? focusBorderColor;
  final Color? unfocusBorderColor;
  final double? contentPadding;
  final bool? enable;
  final String? text;
  final String? sufixLabel;
  final onTap;
  final onChanged;
  final onSubmitted;
  final double? leftPadding;
  final double? rightPadding;
  final TextEditingController? controller;
  final Function? focusListner;
  bool isReadOnly;

//  late FocusNode focusNode;
  final FieldValidator? validator;
  TextInputType? keyboardType;
  final inputFormatters;
  final Color textColor;
  final bool? obsecureText;
  final Widget? suffixIconWidet;
  int minLines = 1;
  int maxLines = 1;
  FocusNode? focusNode;
  bool autoFocus;
  TextDirection? textDirection;

  MyTextField(
      {Key? key,
      this.textDirection,
      this.textColor = AppColor.blackColor,
      this.obsecureText,
      this.focusNode,
      this.fillColor,
      this.labelText,
      this.maxLines = 1,
      this.minLines = 1,
      this.hintText,
      this.hintColor,
      this.labelColor,
      this.onSubmitted,
      this.prefixIcon,
      this.inputFormatters,
      this.suffixIcon,
      this.focusBorderColor,
      this.unfocusBorderColor,
      this.onChanged,
      this.contentPadding,
      this.enable = true,
      this.text,
      this.sufixLabel,
      this.leftPadding,
      this.rightPadding,
      this.controller,
      this.focusListner,
      this.validator,
      this.autoFocus = false,
      this.isReadOnly = false,
      this.onTap,
      this.suffixIconWidet,
      this.keyboardType})
      : super(key: key) {
    /* focusNode = FocusNode();
    if (focusListner != null) {
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          focusListner!();
        }
      });
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding ?? 0.w,
        right: rightPadding ?? 0.w,
      ),
      child: TextFormField(
        obscureText: obsecureText ?? false,
        readOnly: isReadOnly,
        style:
            AppTextStyles.textStyleNormalBodySmall.copyWith(color: textColor),
        controller: controller ?? TextEditingController(),
        initialValue: text,
        minLines: minLines,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        focusNode: focusNode,
        onTap: onTap,
        keyboardType: keyboardType ?? TextInputType.text,
        enabled: enable,
        onFieldSubmitted: onSubmitted,
        //onFieldSubmitted: onChanged,
        // focusNode: focusNode,
        validator: validator,
        onChanged: onChanged,
        autofocus: autoFocus,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(contentPadding ?? 10.h),
          fillColor: fillColor,
          suffixIcon: suffixIconWidet,
          labelText: labelText ?? "",
          hintText: hintText,
          filled: fillColor != null,
          hintStyle: AppTextStyles.textStyleNormalBodySmall
              .copyWith(color: hintColor ?? AppColor.primaryBlueDarkColor),
          labelStyle: AppTextStyles.textStyleNormalBodySmall
              .copyWith(color: labelColor ?? AppColor.primaryBlueDarkColor),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryBlueColor)
              //  when the TextFormField in unfocused
              ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryBlueColor)
              //  when the TextFormField in focused
              ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryBlueColor)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: const BorderSide(color: AppColor.redColor),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String buttonText;
  final onTap;
  final double? padding;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final Widget? prefixIcon;
  final Widget? postFixIcon;
  final double? height;
  final double? cornerRadius;
  final TextStyle? textStyle;
  final double? leftPadding;
  final double? rightPading;

  const Button(
      {Key? key,
      required this.buttonText,
      this.onTap,
      this.prefixIcon,
      this.postFixIcon,
      this.padding,
      this.color,
      this.textColor,
      this.cornerRadius,
      this.borderColor,
      this.textStyle,
      this.width,
      this.height,
      this.leftPadding,
      this.rightPading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: () {},
      child: Padding(
        padding: EdgeInsets.only(
            left: leftPadding == null ? 0.w : leftPadding!,
            right: rightPading == null ? 0.w : rightPading!),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(padding ?? 80.w),
          decoration: BoxDecoration(
              border: borderColor == null
                  ? null
                  : Border.all(
                      color: borderColor!,
                    ),
              borderRadius:
                  BorderRadius.all(Radius.circular(cornerRadius ?? 50.r)),
              color: color ?? AppColor.primaryBlueDarkColor),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              prefixIcon ?? const IgnorePointer(),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        AppTextStyles.textStyleBoldBodySmall
                            .copyWith(color: textColor ?? AppColor.whiteColor),
                  ),
                ),
              ),
              postFixIcon ?? const IgnorePointer(),
            ],
          )),
        ),
      ),
    );
  }
}

typedef String ItemAsString(dynamic x);

class ExpandableCardContainer extends StatefulWidget {
  bool isExpanded;
  Widget collapsedChild;
  Widget expandedChild;

  ExpandableCardContainer(
      {Key? key,
      required this.isExpanded,
      required this.collapsedChild,
      required this.expandedChild})
      : super(key: key);

  @override
  _ExpandableCardContainerState createState() =>
      _ExpandableCardContainerState();
}

class _ExpandableCardContainerState extends State<ExpandableCardContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 4000),
        curve: Curves.easeInOut,
        child: widget.isExpanded ? widget.expandedChild : widget.collapsedChild,
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton(
      {required this.title,
      required this.onPressed,
      this.bgColor,
      this.textColor});

  dynamic onPressed;
  String title;

  Color? bgColor;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 300, height: 70),
        child: ElevatedButton(
            onPressed: onPressed,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(title,
                  style: TextStyle(color: textColor ?? AppColor.whiteColor)),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  bgColor ?? AppColor.primaryBlueDarkColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )),
            )));
  }
}

Widget keyValueRowWidget(
    {required String title, required String value, required bool isGrey}) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isGrey ? AppColor.alphaGrey : AppColor.whiteColor),
    child: Row(
      children: [
        Expanded(
            child: Center(
          child: Text(
            title,
            style: AppTextStyles.textStyleNormalBodyMedium,
          ),
        )),
        Expanded(
            child: Center(
          child: Text(
            value,
            style: AppTextStyles.textStyleNormalBodyMedium,
          ),
        )),
      ],
    ),
  );
}

Widget getFeatureItem({required String title, Color? color}) {
  return Container(
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: color ?? AppColor.alphaGrey,
        borderRadius: BorderRadius.circular(10)),
    child: Text(
      title,
      style: AppTextStyles.textStyleNormalBodyMedium.copyWith(
          color: color != null ? AppColor.whiteColor : AppColor.blackColor),
    ),
  );
}

myAppBar(
    {String? title,
    Color backGroundColor = AppColor.whiteColor,
    List<Widget>? actions,
    Widget? titleWidget,
    bool? centerTitle,
    BuildContext? context,
    bool goBack = true,
    onBacKTap}) {
  return AppBar(
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColor.blackColor),
    actions: actions ?? [],
    automaticallyImplyLeading: goBack,
    backgroundColor: backGroundColor,
    leading: titleWidget,
    centerTitle: centerTitle ?? false,
    title: Text(
      title ?? "",
      style: AppTextStyles.textStyleBoldBodyMedium
          .copyWith(color: AppColor.primaryBlueDarkColor),
    ),
  );
}

class CircleIconButton extends StatelessWidget {
  final double size;
  final onPressed;
  final IconData icon;

  CircleIconButton({this.size = 16.0, this.icon = Icons.clear, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: this.onPressed ?? () {},
        child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment(0.0, 0.0), // all centered
              children: <Widget>[
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryBlueDarkColor),
                      shape: BoxShape.circle),
                ),
                Icon(
                  icon,
                  size: size * 0.6, // 60% width for icon
                )
              ],
            )));
  }
}

class TriangleTabIndicator extends Decoration {
  final BoxPainter _painter;
  dynamic onChanged;

  TriangleTabIndicator(
      {required Color color, required double radius, required this.onChanged})
      : _painter = DrawTriangle(color);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class DrawTriangle extends BoxPainter {
  late Paint _paint;

  DrawTriangle(Color color) {
    _paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset triangleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height + 10);
    var path = Path();

    path.moveTo(triangleOffset.dx, triangleOffset.dy);
    path.lineTo(triangleOffset.dx + 10, triangleOffset.dy - 12);
    path.lineTo(triangleOffset.dx - 10, triangleOffset.dy - 12);
    path.close();

    canvas.drawPath(path, _paint);
  }
}

class NetworkCircularImage extends StatefulWidget {
  String url;
  double radius;
  double? width;
  double? height;
  BoxFit? fit;

  NetworkCircularImage(
      {Key? key,
      required this.url,
      this.radius = 34,
      this.width,
      this.height,
      this.fit})
      : super(key: key);

  @override
  _NetworkCircularImageState createState() => _NetworkCircularImageState();
}

class _NetworkCircularImageState extends State<NetworkCircularImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
        radius: widget.radius,
      ),
      placeholder: (context, url) => CircleAvatar(
        radius: widget.radius,
        child: const CircularProgressIndicator(
          color: AppColor.primaryBlueColor,
        ),
      ),
      errorWidget: (context, url, error) {
        return CircleAvatar(
          backgroundImage:
              const AssetImage('assets/images/place_your_image.png'),
          radius: widget.radius,
        );
      },
    );
  }
}

class NetworkPlainImage extends StatefulWidget {
  String url;

  double? width;
  double? height;
  BoxFit? fit;

  NetworkPlainImage(
      {Key? key, required this.url, this.width, this.height, this.fit})
      : super(key: key);

  @override
  _NetworkPlainImageState createState() => _NetworkPlainImageState();
}

class _NetworkPlainImageState extends State<NetworkPlainImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      width: widget.width,
      height: widget.height,
      key: UniqueKey(),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
    );
  }
}
