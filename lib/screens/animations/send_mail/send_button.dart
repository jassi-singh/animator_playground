import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/button_bloc.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        ButtonBloc buttonBloc = context.read<ButtonBloc>();
        return ElevatedButton(
          onPressed: _onPressed(buttonBloc, state),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xff16b396),
            onPrimary: Colors.white,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 40,
            ),
          ),
          child: Text(
            _buttonText(state),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        );
      },
    );
  }

  _onPressed(ButtonBloc buttonBloc, ButtonState state) {
    if (state is InitialState) {
      return () => buttonBloc.add(SendEvent());
    } else if (state is CompletedState) {
      return () => buttonBloc.add(ResetEvent());
    } else {
      return null;
    }
  }

  String _buttonText(ButtonState state) {
    if (state is InitialState) {
      return 'Send Mail';
    } else if (state is LoadingState) {
      return 'Sending...';
    } else if (state is CompletedState) {
      return 'Reset';
    } else {
      return 'ERROR';
    }
  }
}
