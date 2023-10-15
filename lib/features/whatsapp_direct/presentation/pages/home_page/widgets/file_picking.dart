import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/pick_files_logic/pick_files_logic_cubit.dart';

class FilePicking extends StatelessWidget {
  const FilePicking({
    super.key,
  });

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
          child: BlocBuilder<PickFilesLogicCubit, List<String>>(
            builder: (context, filesList) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<PickFilesLogicCubit>().pickFiles();
                      },
                      icon: const Icon(Icons.file_copy),
                      label: const Text("Select Files"),
                    ),
                  ),
                  if (filesList.isNotEmpty)
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        itemCount: filesList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final fileName = basename(filesList[index]);
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.file_present_rounded),
                                  iconSize: 40,
                                  onPressed: () {
                                    context
                                        .read<PickFilesLogicCubit>()
                                        .deleteFile(index);
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
                  if (filesList.isNotEmpty)
                    const Text(
                      "Tap on File to Remove",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
