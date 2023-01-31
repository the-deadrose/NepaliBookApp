import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';



final loginProvider = StateNotifierProvider.autoDispose<ToggleProvider, bool>((ref) => ToggleProvider(true));


class ToggleProvider extends StateNotifier<bool>{
  ToggleProvider(super.state);

  void change(){
    state = !state;
  }

}


final imageProvider = StateNotifierProvider.autoDispose<ImageProvider, XFile?>((ref) => ImageProvider(null));


class ImageProvider extends StateNotifier<XFile?>{
  ImageProvider(super.state);

  void pickAnImage() async{
    final ImagePicker _picker = ImagePicker();
    state = await _picker.pickImage(source: ImageSource.gallery);
  }

}