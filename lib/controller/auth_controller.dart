import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/constant.dart';
import 'package:tiktok/model/userModel.dart';
import 'package:tiktok/view/screens/auth/home_screen.dart';
import 'package:tiktok/view/screens/auth/login_screen.dart';

class AuthController extends GetxController {
  // creating the instance of the authController
  static AuthController get instance => Get.find<AuthController>();
  late Rx<User?> _user;
  // getter to get the user
  User? get user => _user.value;

  late Rx<File?> _pickedImage;

  // creating the getter to get that picked Image
  File? get Profilepick => _pickedImage.value;

  // on ready method
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, setinitial);
  }

  setinitial(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  // function to pick image
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Get.snackbar('profile Pick', 'you have selected your profile pick');
    }

    _pickedImage = Rx<File?>(File(pickedFile!.path));
  }

  // upload to firebase storage
  Future<String?> _uploadToStorage(File image) async {
    try {
      Reference ref = firebaseStorage
          .ref()
          .child('profilePic')
          .child(firebaseAuth.currentUser!.uid);

      UploadTask uploadTask = ref.putFile(image);
      TaskSnapshot snapshot = await uploadTask;

      // getting the download Url
      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      Get.snackbar('Error in creating account', e.toString());
    }
  }

  // registering the user
  void registerUser(
      String email, String password, String userName, File? img) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          userName.isNotEmpty &&
          img != null) {
        var cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String? downloadUrl = await _uploadToStorage(img);
        if (downloadUrl == null) {
          return;
        }

        userModel user = userModel(
            profilePic: downloadUrl,
            uid: cred.user!.uid,
            email: email,
            name: userName);

        // uploading all the record to the firebaseDatabase

        await firebaseFirestore
            .collection('user')
            .doc(cred.user!.uid)
            .set(user.toMap());
        Get.snackbar('Success', 'you have successfully created account');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Function to signin the user
  Future<void> LoginUser(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar('sucess', 'you login sucessfully');
    } catch (e) {
      Get.snackbar('Error', 'there is error in login');
    }
  }
}
