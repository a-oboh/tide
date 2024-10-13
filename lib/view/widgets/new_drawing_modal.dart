import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:tide/view/canvas/notifier/tide_canvas_notifier.dart';

showNewDrawingDialog(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(content: NewDrawingBody());
      });
}

class NewDrawingBody extends ConsumerWidget {
  NewDrawingBody({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: SizedBox(
        height: 100,
        width: 200,
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: formKey,
                child: TextFormField(
                  controller: titleController,
                  onChanged: (value) {},
                  validator: (val) {
                    if (val?.isEmpty == true) {
                      return 'Add a title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                  ),
                ),
              ),
            ),
            Gap(12),
            FilledButton(
              onPressed: () {
                if (formKey.currentState?.validate() == true) {
                  // save new drawing
                  ref.read(tideCanvasNotifierProvider.notifier).createNewEntry(
                        titleController.text.trim(),
                        ref.read(tideCanvasNotifierProvider).currentDrawing,
                        ref.read(tideCanvasNotifierProvider).allDrawings,
                      );
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
