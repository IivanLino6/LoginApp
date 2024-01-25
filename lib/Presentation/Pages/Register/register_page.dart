import 'package:flutter/material.dart';
import 'package:login_app/Presentation/Pages/Register/register_response.dart';
import 'package:login_app/Presentation/Pages/Register/register_viewmodel.dart';
import 'package:login_app/Presentation/Pages/Register/widgets/register_content.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterViewModel vm = Provider.of<RegisterViewModel>(context);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        RegisterResponse(context, vm);
      }
    );
    
    return Scaffold(body:RegisterContent(vm));
  }
}