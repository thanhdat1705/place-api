import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/updated_profile/presenter/updated_profile_presenter.dart';
import 'package:project_places_api_mobile/screens/updated_profile/view/updated_profile_view.dart';
import 'package:project_places_api_mobile/screens/updated_profile/viewmodel/updated_profile_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_places_api_mobile/shared/models/account/account.dart';
import 'package:project_places_api_mobile/shared/requests/update_profile_request/update_profile_request.dart';
import 'package:project_places_api_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';
import 'package:project_places_api_mobile/widgets/color_button/color_button.dart';
import 'package:project_places_api_mobile/widgets/header_profile/header_profile.dart';
import 'package:project_places_api_mobile/widgets/text_form_field/customized_text_form_field.dart';

class UpdatedProfileBody extends StatefulWidget {
  final UpdatedProfilePresenter presenter;
  UpdatedProfileBody(this.presenter, {Key key}) : super(key: key);

  @override
  _UpdatedProfileBodyState createState() => _UpdatedProfileBodyState();
}

class _UpdatedProfileBodyState extends State<UpdatedProfileBody>
    with SingleTickerProviderStateMixin {
  Account account;

  ImagePicker imagePicker = new ImagePicker();

  bool changedImgPicker = false;
  AnimationController _controller;
  FocusNode _onFocusedName = new FocusNode();
  FocusNode _onFocusedPhoneNumber = new FocusNode();
  FocusNode _onFocusedEmail = new FocusNode();
  FocusNode _onFocusedDescription = new FocusNode();

  // Color _unfocusedTextFieldColor = Color(0xFFBDBDBD);
  // Color _unfocusedBorderTextFieldColor = Color(0xFFBDBDBD);
  // Color _onfocusedTextFieldColor = Color(0xFF9C27B0);

  // Color for TextFormField
  Color _defaultColor = Color(0xFFBDBDBD);
  Color _enableColor = Color(0xFF9C27B0);

  // Color for Button
  Color _beginColor = Colors.purple[300];
  Color _endColor = Colors.purple;

  File existedImgFile;

  Future getImage() async {
    PickedFile pickedFile =
        await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      this.widget.presenter.onUploadImg(new File(pickedFile.path));
      this.changedImgPicker = true;
    } else {
      print('No image selected.');
      this.changedImgPicker = false;
      //return null;
    }
  }

  void _onPressedButton() {
    _controller.forward();
    setState(
      () {
        if (!this.changedImgPicker) {
          this.widget.presenter.onUpdateProfile(
              new UpdateProfileRequest(
                  avatarFile: null,
                  description: this
                      .widget
                      .presenter
                      .updatedProfileViewModel
                      .userDescriptionController
                      .text,
                  displayName: this
                      .widget
                      .presenter
                      .updatedProfileViewModel
                      .displayNameController
                      .text,
                  email: this
                      .widget
                      .presenter
                      .updatedProfileViewModel
                      .userEmailController
                      .text,
                  phoneNumber: this
                      .widget
                      .presenter
                      .updatedProfileViewModel
                      .phoneNumberController
                      .text),
              context);
        } else {
          this.changedImgPicker = false;
          this.widget.presenter.onUpdateProfile(
              new UpdateProfileRequest(
                  avatarFile: this
                      .widget
                      .presenter
                      .updatedProfileViewModel
                      .avatarDisplay
                      .file,
                  description: this
                      .widget
                      .presenter
                      .updatedProfileViewModel
                      .userDescriptionController
                      .text,
                  displayName: this
                      .widget
                      .presenter
                      .updatedProfileViewModel
                      .displayNameController
                      .text,
                  email: this
                      .widget
                      .presenter
                      .updatedProfileViewModel
                      .userEmailController
                      .text,
                  phoneNumber: this
                      .widget
                      .presenter
                      .updatedProfileViewModel
                      .phoneNumberController
                      .text),
              context);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    this.account = this.widget.presenter.updatedProfileViewModel.userAccount;
    this.changedImgPicker = false;
    this
        .widget
        .presenter
        .updatedProfileViewModel
        .userDescriptionController
        .text = this.account.description;
    this.widget.presenter.updatedProfileViewModel.displayNameController.text =
        this.account.displayName;
    this.widget.presenter.updatedProfileViewModel.phoneNumberController.text =
        this.account.phoneNumber;
    this.widget.presenter.updatedProfileViewModel.userEmailController.text =
        this.account.email;
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) _controller.reverse();
      });
    if (this.account.provider == 0) {
      this
          .widget
          .presenter
          .updatedProfileViewModel
          .serviceProviderController
          .text = 'Facebook';
    } else {
      this
          .widget
          .presenter
          .updatedProfileViewModel
          .serviceProviderController
          .text = 'Google';
    }

    this._onFocusedName.addListener(
      () {
        setState(
          () {},
        );
      },
    );
    this._onFocusedPhoneNumber.addListener(
      () {
        setState(
          () {},
        );
      },
    );
    this._onFocusedEmail.addListener(
      () {
        setState(
          () {},
        );
      },
    );
    this._onFocusedDescription.addListener(
      () {
        setState(
          () {},
        );
      },
    );
  }

  @override
  void dispose() {
    this._onFocusedName.dispose();
    this._onFocusedPhoneNumber.dispose();
    this._onFocusedEmail.dispose();
    this._onFocusedDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[300],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            iconSize: getProportionateScreenWidth(30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Playball',
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(24),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    // HeaderProfile(
                    //   headerName: 'Edit Profile',
                    //   heightContainer: getProportionateScreenHeight(30),
                    //   widthContainer: getProportionateScreenWidth(30),
                    //   widthIcon: getProportionateScreenWidth(30),
                    //   widthText: getProportionateScreenWidth(30),
                    //   textColor: Colors.black,
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: getProportionateScreenHeight(30),
                          ),
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.fromLTRB(
                              getProportionateScreenWidth(55),
                              0,
                              getProportionateScreenWidth(50),
                              0),
                          height: getProportionateScreenHeight(140),
                          width: getProportionateScreenWidth(300),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: getProportionateScreenWidth(125),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: this.changedImgPicker
                                          ? this
                                              .widget
                                              .presenter
                                              .updatedProfileViewModel
                                              .avatarDisplay
                                          : new NetworkImage(
                                              this.account.photoUrl)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: getProportionateScreenHeight(100),
                                    left: getProportionateScreenWidth(80)),
                                child: InkWell(
                                  onTap: this.getImage,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: getProportionateScreenWidth(60),
                                    height: getProportionateScreenHeight(50),
                                    child: SvgPicture.network(ICONCAMERA),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(10),
                          getProportionateScreenHeight(10),
                          getProportionateScreenWidth(10),
                          0),
                      height: getProportionateScreenHeight(500),
                      width: getProportionateScreenWidth(350),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: getProportionateScreenHeight(20)),
                          CustomizedTextFormField(
                            onFocusedTextField: this._onFocusedName,
                            textFieldController: this
                                .widget
                                .presenter
                                .updatedProfileViewModel
                                .displayNameController,
                            textFormFieldName: 'Name',
                            keyboardType: TextInputType.text,
                            defaultColor: this._defaultColor,
                            enableColor: this._enableColor,
                            readOnly: false,
                            onChanged: null,
                          ),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          CustomizedTextFormField(
                            onFocusedTextField: this._onFocusedPhoneNumber,
                            textFieldController: this
                                .widget
                                .presenter
                                .updatedProfileViewModel
                                .phoneNumberController,
                            keyboardType: TextInputType.number,
                            defaultColor: this._defaultColor,
                            enableColor: this._enableColor,
                            textFormFieldName: 'Phone Number',
                            readOnly: false,
                            onChanged: null,
                          ),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          CustomizedTextFormField(
                            onFocusedTextField: this._onFocusedEmail,
                            textFieldController: this
                                .widget
                                .presenter
                                .updatedProfileViewModel
                                .userEmailController,
                            textFormFieldName: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            defaultColor: this._defaultColor,
                            enableColor: this._enableColor,
                            readOnly: false,
                            onChanged: null,
                          ),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          CustomizedTextFormField(
                            onFocusedTextField: this._onFocusedDescription,
                            textFieldController: this
                                .widget
                                .presenter
                                .updatedProfileViewModel
                                .userDescriptionController,
                            keyboardType: TextInputType.text,
                            textFormFieldName: 'Description',
                            defaultColor: this._defaultColor,
                            enableColor: this._enableColor,
                            readOnly: false,
                            onChanged: null,
                          ),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          CustomizedTextFormField(
                            onFocusedTextField: null,
                            textFieldController: this
                                .widget
                                .presenter
                                .updatedProfileViewModel
                                .serviceProviderController,
                            keyboardType: null,
                            textFormFieldName: null,
                            defaultColor: this._defaultColor,
                            enableColor: null,
                            readOnly: true,
                            onChanged: null,
                          ),
                        ],
                      ),
                    ),
                    ColorButton(
                      buttonName: 'Update Profile',
                      sizeContainerButton: getProportionateScreenWidth(150),
                      buttonFontSize: getProportionateScreenWidth(16),
                      buttonFontColor: Colors.white,
                      controller: this._controller,
                      normalButtonColor: this._beginColor,
                      onPressedButtonColor: this._endColor,
                      onPressed: this._onPressedButton,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
