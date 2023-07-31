import 'package:flutter/material.dart';
import 'package:zilmoney_task/constants/const_color.dart';
import 'package:zilmoney_task/constants/const_size.dart';

import 'widgets/textform_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The Online Shop',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            kHeight50,
            Text('Username'),
            const TextFormFieldWidget(),
            kHeight20,
            Text('Password'),
            const TextFormFieldWidget(),
            kHeight20,
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Text('Remember password'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(color: kWhite),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: kBlack),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
