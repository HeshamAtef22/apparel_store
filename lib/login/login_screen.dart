

//botton color Default
import 'package:flutter/material.dart';

import '../components/conmponents.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //هعمل متغير  خاص بالفورم علشان امرر منه الداتا للكاي وهيبقي من نفس النوع اللي بيحمله الكاي الخاص بالفورم
  GlobalKey<FormState> _keystat = GlobalKey();

  //متغيرلاظهار الباسورد او اخفاءه
  bool _showpassword = true;

  //هعمل متغيرين احفظ فيهم الميل والباسورد
  String? email;
  String? password;

  //متغيرات لحفظ الداتا وعمل كونترول عليها داخل التيكست فيلد
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Background Color and theme
      body: Container(

        //باستخدام الميديا كويري هخلي الكونتينر ياخد طول  وعرض الجهاز بالكامل
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //logo image
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Icon(Icons.shopping_bag_outlined,size: 100,color: ColorTheme(),),
                  ),
                  //Text at the bottom of the logo
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Wellcome To Apparel",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  //Text at the bottom of the logo
                  Text(
                    "Sign in to continue",
                    style: TextStyle(color: Colors.blueGrey[600]),
                  ),
                  const SizedBox(height: 20),
                  //E-mail and pass TextFormField
                  Form(
                    key: _keystat,
                    //autovalidateMode ضيفته في الفورم الاساسي علشان لو عندي اكتر من تيكستفيلد يعمل تشيك عليهم كلهم اوتوماتيك
                    //autovalidateMode: AutovalidateMode.always,
                    //TextFormField for Email and Password
                    child: Column(
                      children: [
                        //E-mail TextFormField
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          //Email TextFormField
                          child: defaultTextFormFiled(
                            //controller لحفظ القيمة او الداتا داخل المتغير واقدر اكنترول عليها او استخدمها
                            controller: emailController,
                            keyboardtype: TextInputType.emailAddress,
                            //validator بيخزن التكست او الداتا اليي بيدخلها المستخدم في المتغير فاليو اللي هو المتغير الخاص بالفانكشن بتاعته
                            //ليه مزايا كتير منها انه لو المستخدم مدخلش داتا في البورد يقدر يظهرله رسالة ان الحقل فارغ
                            //او مثلا حددتله نوع داتا ودخل عكسها او عدد حروف اكبر هنا الفاليديتور بيظهر رسالة للمستخدم بالخطأ اللي بيعمله
                            //تابع الكود علشان تعرف الاستخدام
                            validate: (value) {
                              //هنا هبدأ اديله الاحتمالات بتاعتي والرسايل اللي هتظهر لليوزر
                              if (value!.isEmpty) {
                                return "email must not be empty";
                              } else if (!value.contains("@") ||
                                  !value.contains(".")) {
                                return "wrong email format. Example: mail@gamil.com";
                              }
                              ;
                            },
                            label: "E-mail",
                            hint: "Your E-mail",
                            prefix: Icons.email_outlined,
                          ),
                        ),
                        //Password TextFormField
                        defaultTextFormFiled(
                          controller: passwordController,
                          keyboardtype: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Password must not be empty";
                            }else if (value.length < 8) {
                              return "Password is too short";
                            }
                          },
                          label: "Password",
                          hint: "Your Password",
                          prefix: Icons.lock,
                          //obscureText لاخفاء الداتا المكتوبة زي الباسورد
                          isPassword: _showpassword,
                          //هعمل اظهار واخفائ للباسورد عند الضغط علي الايقون الخاصة باخفاء الباسورد
                          suffixicon: IconButton(
                            icon: _showpassword
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _showpassword = !_showpassword;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        //forget password
                        Text("Forget Password?",style: TextStyle(color: Color.fromRGBO(1, 152, 164, 10),fontWeight: FontWeight.w600),),
                        //MaterialButton for sign in
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 15),
                          child: DefaultButton(
                              function: () {
                                {
                                  //هعمل شرط لو شروط الفالديت الخاصة بالتيكست فيلد اتحققت  النافيجيتور يشتغل ويتم تسجيل الدخول
                                  //غير كدا لا
                                  if (_keystat.currentState!.validate()) {
                                    Navigator.of(context)
                                        .popAndPushNamed("homelayout");
                                  }
                                }
                                ;
                              },
                              text: "login"),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 2,
                          ),
                        ),
                        const Text("OR",style: TextStyle(fontWeight: FontWeight.w600),),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //sing with social media
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //login with facebook
                      circleContainerBotton(
                        onTap: (){},
                        child: Image.asset(
                          "assets/images/facebook2.png",
                          width: 60,
                        ),
                      ),

                      //login with google
                      circleContainerBotton(
                        onTap: (){},
                        child: Image.asset(
                          "assets/images/g.png",
                          width: 60,
                        ),
                      ),

                      //login with twitter
                      circleContainerBotton(
                        onTap: (){},
                        child: Image.asset(
                          "assets/images/twitter2.png",
                          width: 1,
                        ),
                      ),



                    ],
                  ),
                  SizedBox(height: 40),

                  SizedBox(height: 60),
                  //don't have account // register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).popAndPushNamed("register");
                        },
                        child: Text("Register",style: TextStyle(color: Color.fromRGBO(1, 152, 164, 10),fontWeight: FontWeight.w600),),),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
