// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoyo/core/constants/app_dimens.dart';
import 'package:yoyo/core/dtos/update_user_dto.dart';
import 'package:yoyo/core/utils/custom_functions.dart';

import 'package:yoyo/domain/entity/user_entity.dart';
import 'package:yoyo/presentation/cubits/state.dart';
import 'package:yoyo/presentation/widgets/customs/button/elevated_button.dart';
import 'package:yoyo/presentation/widgets/customs/textfield.dart';

import '../../../core/constants/app_theme.dart';
import '../../cubits/common/theme_picker_cubit.dart';
import '../../widgets/customs/icons/icon_button.dart';
import '../../widgets/customs/text.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  final UserEntity user;
  const EditProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final username = TextEditingController();
  final bio = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    username.text = widget.user.username;
    bio.text = widget.user.bio ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final image = context.select((ImageCubit img) => img.state);
        final themePicked =
            context.select((ThemePickerCubit theme) => theme.state);
        return WillPopScope(
          onWillPop: () async {
            context
                .read<UserCubit>()
                .onFetchUser(uid: FirebaseAuth.instance.currentUser?.uid ?? '');
            return true;
          },
          child: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              leading: CustomIconButton(
                onTap: () {
                  AutoRouter.of(context).pop();
                },
                glow: true,
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppTheme.white,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipOval(
                        child: image != null
                            ? Image.file(
                                File(image.path),
                                height: 12.h,
                                width: 12.h,
                                fit: BoxFit.cover,
                              )
                            : widget.user.imageLink != null
                                ? CachedNetworkImage(
                                    imageUrl: widget.user.imageLink!,
                                    height: 12.h,
                                    width: 12.h,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    themePicked.logo,
                                    height: 12.h,
                                    width: 12.h,
                                    fit: BoxFit.cover,
                                  ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -2.h,
                        child: CustomIconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Theme.of(context).primaryColor,
                          ),
                          bgColor: AppTheme.white,
                          radius: AppDimens.maxRadius,
                          onTap: () {
                            scaffoldKey.currentState?.showBottomSheet(
                              (context) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        context
                                            .read<ImageCubit>()
                                            .pickImage(
                                                source: ImageSource.gallery)
                                            .then((value) =>
                                                Navigator.pop(context));
                                      },
                                      iconColor: Colors.white,
                                      leading: const Icon(Icons.image_rounded),
                                      title: const CustomText('Gallery'),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        context
                                            .read<ImageCubit>()
                                            .pickImage(
                                                source: ImageSource.camera)
                                            .then((value) =>
                                                Navigator.pop(context));
                                      },
                                      iconColor: Colors.white,
                                      leading: const Icon(
                                          Icons.camera_enhance_rounded),
                                      title: const CustomText('Camera'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    hint: 'Username',
                    label: 'Username',
                    controller: username,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    hint: 'Enter your bio',
                    label: 'Bio',
                    controller: bio,
                    descType: true,
                  ),
                  SizedBox(height: 2.h),
                  BlocConsumer<StorageCubit, StorageState>(
                      listener: (context, state) {
                    if (state is StorageLoading) {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          });
                    } else if (state is StorageDone) {
                      if (AutoRouter.of(context).canPop()) {
                        AutoRouter.of(context).pop();
                      }
                      context
                          .read<UserCubit>()
                          .onUpdateUser(
                            updateUserDto: UpdateUserDto(
                              username: username.text,
                              bio: bio.text,
                              uid: widget.user.uid,
                              imageLink: state.path ?? widget.user.imageLink,
                            ),
                            path: state.path,
                          )
                          .then((value) async {
                        CustomFunctions.showSnackBar(
                                context, 'Successfuly updated your account.')
                            .then((value) {
                          if (AutoRouter.of(context).canPop()) {
                            AutoRouter.of(context).pop();
                          }
                        });
                      });
                    }
                  }, builder: (context, state) {
                    return CustomElevatedButton(
                      'Update',
                      onPressed: () {
                        if (image != null) {
                          context.read<StorageCubit>().onUploadImage(
                                path:
                                    'user/${FirebaseAuth.instance.currentUser?.uid}',
                                file: File(image.path),
                              );
                        } else {
                          context.read<StorageCubit>().onUploadImage();
                        }
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
