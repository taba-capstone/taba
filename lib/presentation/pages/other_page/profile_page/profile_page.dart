import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:taba/presentation/pages/auth_page/cubit/auth_cubit.dart';
import 'package:taba/presentation/pages/other_page/profile_page/edit_email_page/edit_email_page.dart';
import 'package:taba/utils/style_config.dart';
import 'package:flutter/cupertino.dart';
import '../../../bloc/user_data_cubit.dart';
import '../../../provider/preferences_provider.dart';
import '../../auth_page/auth.dart';
import 'edit_password_page/edit_password_page.dart';
import 'edit_username_page/edit_username_page.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile_page';

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<UserDataCubit>().getUserData());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              if (Provider.of<PreferencesProvider>(context).isDarkTheme) ...[
                Theme.of(context).backgroundColor,
                Theme.of(context).backgroundColor,
              ] else ...[
                Theme.of(context).primaryColor,
                Theme.of(context).backgroundColor,
              ],
            ],
            center: Alignment.bottomLeft,
            stops: const [
              0.0,
              0.9,
            ],
            radius: 1.5.r,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).focusColor,
                )),
            title: const Text('Pengguna'),
            centerTitle: false,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, EditUsernamePage.routeName);
            },
            backgroundColor: ColorSystem.secondary,
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          body: BlocBuilder<UserDataCubit, UserDataState>(
            builder: (context, state) {
              if (state is UserDataLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserDataSuccess) {
                final user = state.result;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 24.h),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (user.photoURL == null) ...[
                                Icon(
                                  Icons.person,
                                  size: 80.w,
                                  color: Theme.of(context).focusColor,
                                )
                              ] else ...[
                                CachedNetworkImage(
                                  imageUrl: user.photoURL!,
                                  width: 60.w,
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: imageProvider,
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ],
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                user.displayName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'opensans',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.sp,
                                  color: Theme.of(context).focusColor,
                                ),
                              ),
                              Text(
                                user.email,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'opensans',
                                  color: ColorSystem.mediumGrey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor.withOpacity(0.6),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 24.h, horizontal: 12.w),
                          child: Column(
                            children: [
                              _othersItem('Ubah Email Pengguna', (() {
                                Navigator.pushNamed(
                                    context, EditEmailPage.routeName);
                              })),
                              Divider(
                                thickness: 0.5.h,
                              ),
                              _othersItem('Ubah Kata Sandi', (() {
                                Navigator.pushNamed(
                                    context, EditPasswordPage.routeName);
                              })),
                              Divider(
                                thickness: 0.5.h,
                              ),
                              _othersItem('Logout', (() async {
                                context.read<AuthCubit>().logout();
                                Navigator.pushReplacementNamed(
                                    context, Auth.routeName);
                              })),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is UserDataError) {
                return Center(
                  child: Text('Error: ${state.message}'),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _othersItem(
    String title,
    Function() onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h,
        ),
        child: Row(
          children: [
            if (title == 'Logout') ...[
              Icon(Icons.logout, size: 32.w, color: Colors.red),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'opensans',
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ] else ...[
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'opensans',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Theme.of(context).focusColor,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14.w,
                color: ColorSystem.mediumGrey,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
