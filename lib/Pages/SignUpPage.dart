// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_is_empty

import 'package:flutter/material.dart';

import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:web_application/Constant.dart';
import 'package:web_application/Controller/UserController.dart';
import 'package:web_application/GetXController/UserController.dart';
import 'package:web_application/Models/UserModel.dart';

import 'package:web_application/widgets/AppBar.dart';
import 'package:web_application/widgets/MyText.dart';
import 'package:web_application/widgets/MyTextField.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool privarcyReaded = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController configNewPasswordController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  UserController userController = UserController();
  bool isMale = true;
  bool isSignupScreen = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: MyAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: double.infinity,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  color: Colors.white,
                  // ignore: prefer_const_constructors
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              MyConst.styleWidgetController
                                  .NavigateToSignInOrSignUpPage(false);
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "إنشاء حساب",
                                  style: GoogleFonts.cairo(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: isSignupScreen
                                          ? Theme.of(context).primaryColor
                                          : greenColor),
                                ),
                                if (isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: greenColor,
                                  )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              MyConst.styleWidgetController
                                  .NavigateToSignInOrSignUpPage(true);
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: InkWell(
                              onTap: () {
                                MyConst.styleWidgetController
                                    .NavigateToSignInOrSignUpPage(true);
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "تسجيل الدخول",
                                    style: GoogleFonts.cairo(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: !isSignupScreen
                                            ? Theme.of(context).primaryColor
                                            : greenColor),
                                  ),
                                  if (!isSignupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: greenColor,
                                    )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            MyTextField(
                              icon: Icons.person,
                              hintText: "الاسم الكامل",
                              isEmail: false,
                              isPassword: false,
                              controller: firstNameController,
                            ),
                            // MyTextField(
                            //   icon: Icons.person,
                            //   hintText: "اسم المركز",
                            //   isEmail: false,
                            //   isPassword: false,
                            //   controller: lastNameController,
                            // ),

                            MyTextField(
                              icon: Icons.phone_android_sharp,
                              hintText: "رقم الموبايل",
                              isEmail: true,
                              isPassword: false,
                              controller: mobileController,
                              keyboardType: TextInputType.number,
                            ),
                            MyTextField(
                              icon: Icons.location_city,
                              hintText: "العنوان",
                              isEmail: true,
                              isPassword: false,
                              controller: adressController,
                            ),
                            MyTextField(
                              icon: Icons.lock_sharp,
                              hintText: "كلمة المرور",
                              isEmail: false,
                              isPassword: true,
                              controller: newPasswordController,
                            ),
                            MyTextField(
                              icon: Icons.lock_sharp,
                              hintText: "تأكيد كلمة المرور",
                              isEmail: false,
                              isPassword: true,
                              controller: configNewPasswordController,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                                value: privarcyReaded,
                                onChanged: (value) {
                                  setState(() {
                                    privarcyReaded = value!;
                                  });
                                }),
                            Container(
                              width: MediaQuery.of(context).size.width - 110,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: ListView(
                                            children: [
                                              MyText(
                                                color: blueColor,
                                                content: "سياسة الخصوصية",
                                                size: 20,
                                                bold: true,
                                              ),
                                              Divider(
                                                color: blueColor,
                                              ),
                                              MyText(
                                                color: blueColor,
                                                content:
                                                    // ignore: unnecessary_string_escapes
                                                    "سياسة الإستخدام والخصوصية\nأولا : \nالتطبيق خاص بنقاط البيع وموزعين الوحدات الخليويه وغير استعماله من الأفراد .\nثانيا : \nإن تطبيق فواتيري هو تطبيق إلكتروني لتنظيم عملية بيع الوحدات الخليوية وتطبيق يعتمد على الوساطة بين شركات الخليوي والإنترنت بحيث يقدم خدمة سريعة للسادة أصحاب محلات الخليوي ونقاط البيع المهتمة بهذه الخدمات المذكورة بشكل سريع ودقيق عملية وحسابية .\nثالثا : \nتعود حقوق ملكية تطبيق فواتيري  لشركة شربك للاتصالات محمد رامي وعبدالرحمن شربك -  شركة تضامنية والتي مقرها محافظة حمص :\nهاتف :\n0955710030 \nوطبيعة عمل الشركة منذ أكثر من 12 سنة في مجال توزيع الوحدات الخليوية وتسديد الفواتير وتخديم نقاط البيع والموزعين وبذلك تعتبر شركة شربك للإتصالات هي المسؤولة بشكل كامل عن التطبيق وإدارته ومتابعة الحلول والمشاكل عن طريق أرقام الهواتف المذكورة أعلاه بالإضافة إلى أرقام الخليوي المذكورة داخل التطبيق وهي على استعداد تام لتقديم الخدمة على أفضل وجه على مدار 24 ساعة.\nرابعا : \n1- عند قيامك بإنشاء حساب على التطبيق فإن التطبيق يطلب منك المعلومات التالية : \n- الاسم الثلاثي باللغة العربية ( حصرا ) \n- عنوان المحافظة والمنطقة المتواجد بها \n- إنشاء كلمة مرور تتألف من أرقام وأحرف ورموز وذلك لضمان حماية الحساب بشكل جيد \n2- جميع العمليات التي تقوم بها على التطبيق من تحويل وحدات أو تسديد فواتير هي مخزنة لدى شركة  - شربك الاتصالات ويمكنها الإطلاع عليها وهي تتعهد بالحفاظ على السرية المعلومات بالإضافة إلى إمكانية الإطلاع عليها من قبلكم من داخل التطبيق\n3- عند تثبيت التطبيق على الهاتف الخاص بكم لا يتطلب أي اذن دخول أو صلاحية أو معلومات خاصة لأي شيء موجود بالهاتف الخاص بكم . \nصلاحيات عمل التطبيق : \n- لا يعمل التطبيق خارج الجمهورية العربية السورية بالإضافة \nأنه يتوقف عن العمل في حال استخدام برنامج كاسر البروكسي على الجهاز الخاص بكم . \n- تتعهد الشركة المسؤولة عن التطبيق بالحفاظ على السرية البيانات والعمليات الخاصة بكم عند استخدام التطبيق . \n- عند إنشاء حساب يتم التواصل من قبل خدمة الزبائن معكم على الرقم الخليوي الموجود على الحساب من قبلك والتأكد من المعلومات المرفقة وبعدها يتم تعبئة رصيد لكم عن طريق الإيداع البنكي في حساباتنا البنكية في الجمهورية العربية السورية أو عن طريق مندوب شركتنا في حال تواجدكم في منطقة بتوفر لنا فيها وكيل أو مندوب . \n- في حال تم التواصل على رقم الخليوي الموضوع من قبلكم ولم يتم الرد أو لم يتم التزويد بالاسم الثلاثي والعنوان الصحيح فإن الشركة لن تقوم بتعبئة الرصيد لكم وعلى الشركة المسؤولة عن التطبيق تقديم لكم خدمة",
                                                size: 16,
                                                bold: false,
                                              ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent)),
                                                onPressed: () {
                                                  setState(() {
                                                    privarcyReaded = true;
                                                  });
                                                  Get.back();
                                                },
                                                child: MyText(
                                                  content: "الموافقة",
                                                  bold: true,
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent)),
                                                onPressed: () {
                                                  Get.back();
                                                  setState(() {
                                                    privarcyReaded = false;
                                                  });
                                                },
                                                child: MyText(
                                                  content: "الخروج",
                                                  bold: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ));
                                },
                                child: MyText(
                                  content:
                                      "لقد قرأت بنود الخصوصية وأوافق عليها",
                                  bold: true,
                                  color: blueColor,
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (firstNameController.text.length != 0 &&
                              // lastNameController.text.length != 0 &&
                              mobileController.text.length != 0 &&
                              newPasswordController.text.length != 0 &&
                              adressController.text.length != 0 &&
                              configNewPasswordController.text.length != 0) {
                            if (configNewPasswordController.text.length < 8 ||
                                newPasswordController.text.length < 8) {
                              Get.defaultDialog(
                                  content: MyText(
                                    size: 16,
                                    bold: false,
                                    content:
                                        "يجب أن تكون كلمة المرور أكثر من ثمانية أرقام أو أحرف",
                                  ),
                                  title: "تنبيه",
                                  actions: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent)),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: MyText(
                                          content: "تم",
                                        ))
                                  ]);
                            } else if (!privarcyReaded) {
                              Get.defaultDialog(
                                  content: MyText(
                                    size: 16,
                                    bold: false,
                                    content:
                                        "يجب قراءة سياسة الخصوصية والموافقة عليها",
                                  ),
                                  title: "تنبيه",
                                  actions: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent)),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: MyText(
                                          content: "تم",
                                        ))
                                  ]);
                            } else if (newPasswordController.text ==
                                configNewPasswordController.text) {
                              UserGetXController userGetXController =
                                  UserGetXController();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              );
                              userGetXController.signUp(UserModel(
                                  userName: "",
                                  email: "",
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  mobile: mobileController.text,
                                  password: newPasswordController.text,
                                  adress: adressController.text));
                            } else {
                              Get.defaultDialog(
                                  title: "تنبيه",
                                  content: MyText(
                                    size: 16,
                                    bold: false,
                                    content: "كلمات المرور غير متطابقة",
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent)),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: MyText(
                                          content: "تم",
                                        ))
                                  ]);
                            }
                          } else {
                            Get.defaultDialog(
                                title: "تنبيه",
                                content: MyText(
                                  size: 16,
                                  bold: false,
                                  content: "الرجاء ملئ كافة البيانات الضرورية",
                                ),
                                actions: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent)),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: MyText(
                                        content: "تم",
                                      ))
                                ]);
                          }
                        },
                        child: Center(
                          child: Container(
                            height: 90,
                            width: 90,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Theme.of(context).primaryColor,
                                        Colors.green[100]!
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(.3),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0, 1))
                                  ]),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
