import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';

part 'pick_files_logic_state.dart';

class PickFilesLogicCubit extends Cubit<List<String>> {

  PickFilesLogicCubit() : super(<String>[]);

  // final List<String> _filesList = [];

  void pickFiles() async {
    emit([]);
    // FilePickerResult? result =
    //     await FilePicker.platform.pickFiles(allowMultiple: true);
    // if (result != null) {
    //   List<File> files = result.paths.map((path) => File(path!)).toList();
    //   _filesList.addAll(files.map((e) => e.path));
    //   emit(_filesList);
    // }
    // emit(_filesList);
  }

  void deleteFile(int index) {
    // emit([]);
    // _filesList.removeAt(index);
    // emit(_filesList);
  }
}
