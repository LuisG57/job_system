import 'package:flutter/material.dart';

class PostJobButton extends StatelessWidget {
  const PostJobButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.post_add),
          const Text('Post a job'),
        ],
      ),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
    );
  }
}
