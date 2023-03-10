import 'package:flutter/material.dart';
import '../Backend/group.dart';
import 'group_landing_page.dart';

class GroupWidget extends StatefulWidget {
  final Group group;
  const GroupWidget({Key? key, required this.group}) : super(key: key);

  @override
  State<GroupWidget> createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<GroupWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        color: const Color.fromARGB(245, 255, 255, 255),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    widget.group.imageURL,
                  ),
                  height: 120,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            const Divider(color: Colors.grey),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                child: Text(
                  (widget.group.name),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                child: Text(
                  (widget.group.description),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  child: const Text('GO TO GROUP'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GroupLandingPage(group: widget.group),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
