import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

class FilePicking extends StatefulWidget {
  const FilePicking({
    super.key,
  });

  @override
  State<FilePicking> createState() => _FilePickingState();
}

class _FilePickingState extends State<FilePicking> {
  List<String> selectedFiles = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey.shade50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(allowMultiple: true);
                    if (result != null) {
                      List<File> files =
                          result.paths.map((path) => File(path!)).toList();
                      setState(() {
                        selectedFiles.addAll(files.map((e) => e.path));
                      });
                    } else {
                      // User canceled the picker
                    }
                  },
                  icon: const Icon(Icons.file_copy),
                  label: const Text("Select Files"),
                ),
              ),
              if (selectedFiles.isNotEmpty)
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    itemCount: selectedFiles.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final fileName = basename(selectedFiles[index]);
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.file_present_rounded),
                              iconSize: 40,
                              onPressed: () {
                                setState(() {
                                  selectedFiles.removeAt(index);
                                });
                              },
                            ),
                            SizedBox(
                              width: 50,
                              child: Text(
                                fileName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              if (selectedFiles.isNotEmpty)
                const Text(
                  "Tap on File to Remove",
                  style: TextStyle(fontSize: 12,color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
