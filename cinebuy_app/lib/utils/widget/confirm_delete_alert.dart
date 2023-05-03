import 'package:cinebuy_app/view/screen/saved/saved_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future<void> confirmDelete(
    BuildContext context, String ownedMovieId, String email, String title) {
  final provider = Provider.of<SavedViewModel>(context, listen: false);
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Delete Movie'),
      content: Text('Apakah Anda Yakin Ingin Menghapus Film $title ?'),
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
          onPressed: () {
            provider.deleteMovies(ownedMovieId, email);
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}
