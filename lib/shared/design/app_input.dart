import 'package:flutter/material.dart';
import 'package:thimar_app/shared/design/app_image.dart';


class AppInput extends StatefulWidget {
  final String labelText,icon;
  final TextEditingController? controller;
  final bool isPhone,isPassword;
  final FormFieldValidator<String?>? validator;
  final bool isEnabled;

  const AppInput
      ({super.key,
    this.controller,
    this.isEnabled = true,
    required this.labelText,
    required this.icon,
    this.isPhone = false,
    this.isPassword = false
    , this.validator,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordHidden && widget.isPassword,
      validator: widget.validator,
      enabled: widget.isEnabled,
      controller: widget.controller,
      keyboardType: widget.isPhone?TextInputType.phone:null,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: AppImage(
          widget.icon,
        ),
          suffixIcon: widget.isPassword?IconButton(
              onPressed: (){
                isPasswordHidden = !isPasswordHidden;
                setState(() {

                });
              },
            icon: Icon(
              isPasswordHidden?Icons.visibility_off:Icons.visibility,
          ),
          ):null,
          icon: widget.isPhone?Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xffF3F3F3),
              ),
            ),
          height: 60,
            width: 69,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/egypt.jpg",
                  height: 20,
                  width: 32,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                    "+20",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
      ):null,
      ),
    );
  }
}
