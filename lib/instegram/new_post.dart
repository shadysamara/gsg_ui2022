import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gsk_ui/data/dummy_data.dart';
import 'package:gsk_ui/instegram/validator_checkbox.dart';
import 'package:gsk_ui/models/post.dart';
import 'package:gsk_ui/models/post_response.dart';
import 'package:gsk_ui/models/user.dart';
import 'package:image_picker/image_picker.dart';

class NewPost extends StatefulWidget {
  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  File? selectedImage;

  String? title;
  TextEditingController controller = TextEditingController();
  addNewPost() {}

  getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(file!.path);
    setState(() {});
  }
String? requiredValidation(bool? x){
  if(x==false){
    return 'you must accept conditions';
  }
}
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('New Post')),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Form(
            key: formKey,
           child: Column(
              children: [
                InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.grey.withOpacity(0.2),
                      height: 300,
                      width: double.infinity,
                      child: selectedImage == null
                          ? Icon(
                              Icons.add,
                              size: 40,
                            )
                          : Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'required value';
                    } else if (value.length < 10) {
                      return 'your content must be larger than 10 letters';
                    }
                  },
                  controller: controller,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2),
                      hintText: 'Post Content',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
                CheckBoxValid(
                  title: 'accept all conditions',
                  validator: requiredValidation,
                ),
                ElevatedButton(
                    child: Text('Add new Post'),
                    onPressed: () {
                      if (selectedImage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            action: SnackBarAction(
                              label: 'ok',
                              onPressed: () {
                                ScaffoldMessenger.of(context).clearSnackBars();
                              },
                            ),
                            content:
                                Text('you have to select image first'.tr())));
                        // showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return AlertDialog(
                        //         content:
                        //             Text('you have to select image first'.tr()),
                        //         actions: [
                        //           TextButton(
                        //               onPressed: () {
                        //                 Navigator.pop(context);
                        //               },
                        //               child: Text('OK'))
                        //         ],
                        //       );
                        //     });

                      }
                      
                      
                       else if (formKey.currentState!.validate()) {
                        User user = User('Omar',
                            'https://techcrunch.com/wpcontent/uploads/2022/07/ScreenShot20220705at12.46.57pm.png?w=636');
                        Post post = Post.fromFile(
                            content: controller.text, file: selectedImage);
                        PostResponse postResponse = PostResponse(user, post);
                        posts.add(postResponse);
                        // Navigator.pop(context);
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
