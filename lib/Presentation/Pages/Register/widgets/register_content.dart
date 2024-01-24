import 'package:flutter/material.dart';
import 'package:login_app/Presentation/Pages/Register/register_viewmodel.dart';
import 'package:login_app/widgets/cutom_btn.dart';
import 'package:login_app/widgets/text_field.dart';
import 'package:lottie/lottie.dart';


class RegisterContent extends StatelessWidget {
  RegisterViewModel vm;

  RegisterContent(this.vm);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        //Blue Background
        Positioned.fill(
          child: Container(
            color: Color.fromARGB(255, 3, 162, 248),
          ),
        ),
        //Back button
        Positioned(
            top: 60,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        //White background
        Positioned(
            top: screenHeight * .3,
            child: Container(
              height: screenHeight,
              width: screenWidth,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  color: Colors.white),
              child: Column(
                children: [
                  //Title
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //Name field
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DefaultFormField(
                        txt: 'name',
                        onChanged: (value) {
                          vm.changeUsername(value);
                        }),
                  ),
                  //Email field
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DefaultFormField(
                        txt: 'Email',
                        onChanged: (value) {
                          vm.changeEmail(value);
                        }),
                  ),
                  //Phone Number field
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DefaultFormField(
                        txt: 'Phone Number',
                        txtType: TextInputType.phone,
                        onChanged: (value) {
                          vm.changeNumber(value);
                        }),
                  ),
                  //Password
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DefaultFormField(
                        hideTxt: true,
                        txt: 'Password',
                        onChanged: (value) {
                          vm.changePassword(value);
                        }),
                  ),
                  //Verify password
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DefaultFormField(
                        hideTxt: true,
                        txt: 'Confirm passsword',
                        onChanged: (value) {
                          vm.changeValidPassword(value);
                        }),
                  ),
                  //Sign up btn
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                        width: 150,
                        height: 50,
                        child: CustomBtn(
                            txt: 'Sign Up',
                            color: Colors.black,
                            onFcn: () {
                              vm.register();
                            })),
                  )
                ],
              ),
            )),
        //Animation
        Positioned(
          left: 75,
          top: 50,
          child: Center(
            child: SizedBox(
                height: 250,
                width: 250,
                child: Lottie.asset('asset/Lottie/user.json')),
          ),
        ),
      ],
    ));
  }
}
