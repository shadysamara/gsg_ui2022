import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TranslatedUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            if(context.locale.toString()=="ar"){
              context.setLocale(Locale('en'));
            }else{
                context.setLocale(Locale('ar'));
            }
          }, icon: Icon(Icons.language))
        ],
        title: Text('app_name'.tr()),
      ),
      body: Center(child:
      SizedBox(
        height: 100.h,
        width: 200.w,
        child: Text('welcome'.tr(),style: TextStyle(fontSize: 20.sp),))),
    );
  }
}
