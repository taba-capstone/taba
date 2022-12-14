import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taba/presentation/pages/detail_page/detail_page.dart';
import 'package:taba/presentation/pages/p3k_page/p3k_list_page/p3k_list_page.dart';
import 'package:flutter/cupertino.dart';
import '../../../utils/style_config.dart';

class P3kPage extends StatelessWidget {
  const P3kPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              child: Text(
                'Pertolongan Pertama Pada Korban',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'opensans',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).focusColor),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 24.h,
                horizontal: 12.w,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  InkWell(
                    hoverColor: Theme.of(context).backgroundColor,
                    onTap: () {
                      Navigator.pushNamed(context, DetailPage.routeName,
                          arguments: 'https://upp.ac.id/blog/pengertian-p3k');
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                            color: ColorSystem.backgroundDark.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/p3k_case.png',
                              height: 60.h,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'P3K,\nPentingnya P3K,\ndan kotak P3K',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'opensans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                    color: Theme.of(context).focusColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  InkWell(
                    hoverColor: Theme.of(context).backgroundColor,
                    onTap: () {
                      Navigator.pushNamed(context, P3kListPage.routeName);
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                            color: ColorSystem.backgroundDark.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/plester.png',
                              height: 60.h,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Pertolongan\nPertama pada\nKorban',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'opensans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                    color: Theme.of(context).focusColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
