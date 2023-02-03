import 'package:animator_playground/screens/animations/send_mail/bloc/button_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'center_icons.dart';
import 'send_button.dart';

class SendMail extends StatelessWidget {
  const SendMail({Key? key}) : super(key: key);

  List<Widget> get _children => [
        const CenterIcons(),
        const SendButton(),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonBloc(),
      child: Center(
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxHeight > 600) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: _children,
            );
          } else {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: _children,
            );
          }
        }),
      ),
    );
  }
}
