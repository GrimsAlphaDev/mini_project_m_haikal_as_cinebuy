import 'package:cinebuy_app/model/service/auth_service.dart';
import 'package:flutter/cupertino.dart';

Future<void> confirmLogout(BuildContext context, AuthService authService) {
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Logout'),
      content: const Text('Apakah Anda Yakin Ingin Logout ?'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () async {
            await authService.signOut();
            if (context.mounted) {
              Navigator.popUntil(context, (route) => route.isFirst);
            }
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}
