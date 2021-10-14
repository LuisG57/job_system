import 'package:flutter/material.dart';

class PostJobButton extends StatelessWidget {
  const PostJobButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(right: 3),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Colors.greenAccent,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Postear Oferta',
              style: TextStyle(color: Colors.greenAccent, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

// ElevatedButton(
//       onPressed: () {},
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           const Icon(Icons.post_add),
//           const Text('Post a job'),
//         ],
//       ),
//       style:
//           ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
//     );