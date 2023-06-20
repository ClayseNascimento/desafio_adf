import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class Button extends StatefulWidget {
  final String textButton;
  final Function()? onPressed;

  const Button({
    super.key,
    required this.textButton,
    this.onPressed,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return TapDebouncer(
        cooldown: const Duration(seconds: 2),
        onTap: () async {
          if (widget.onPressed != null) widget.onPressed!();
        },
        builder: (_, TapDebouncerFunc? onTap) {
          return ElevatedButton(
            onPressed: widget.onPressed != null ? onTap : null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) return const Color.fromARGB(255, 235, 160, 155);
                return Colors.red;
              }),
              foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                return Colors.white;
              }),
              textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
                return GoogleFonts.publicSans(fontSize: 22, fontWeight: FontWeight.normal);
              }),
              elevation: MaterialStateProperty.resolveWith<double>((states) {
                if (states.contains(MaterialState.disabled)) return 0.0;
                return 3;
              }),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(56))),
              overlayColor: MaterialStateProperty.all(Colors.red[300]),
            ),
            child: SizedBox(
              height: 46,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(widget.textButton, textAlign: TextAlign.center),
                ),
              ),
            ),
          );
        });
  }
}
