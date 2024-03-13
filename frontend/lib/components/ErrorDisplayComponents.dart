import 'package:flutter/cupertino.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class ErrorDisplayComponents extends StatefulWidget {
  final String snackBarTitle;
  final String snackBarWiring;
  final String imagePath;
  const ErrorDisplayComponents(
      {super.key,
      required this.snackBarTitle,
      required this.snackBarWiring,
      required this.imagePath});

  @override
  State<ErrorDisplayComponents> createState() => _ErrorDisplayComponentsState();
}

class _ErrorDisplayComponentsState extends State<ErrorDisplayComponents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Center(child: Image.asset(widget.imagePath)))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: widget.snackBarTitle,
        message: widget.snackBarWiring,
        contentType: ContentType.failure,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
