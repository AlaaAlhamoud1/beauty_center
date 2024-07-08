import 'package:beauty_center/core/utils/extensions/context_extensions.dart';
import 'package:beauty_center/core/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool isDashboard;
  const AppBarWidget(
      {Key? key,
      this.leading,
      this.title,
      this.actions,
      this.backgroundColor,
      required this.isDashboard})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        height: size.height / 5,
        decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fill,
                image: AssetImage(ImagePath.appbarBackgroundImage))),
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              child: Row(
                children: [
                  isDashboard
                      ? const SizedBox()
                      : IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                  isDashboard
                      ? const Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Hi rama',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        )
                      : const SizedBox(),
                  isDashboard
                      ? const Spacer()
                      : Expanded(
                          child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Text(
                                title ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppFonts.appBarTitleFontSize.spMin,
                                ),
                              ),
                            ),
                            const Spacer()
                          ],
                        )),
                  isDashboard
                      ? Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child:
                                    SvgPicture.asset(IconPath.notificationIcon),
                              ),
                              const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
