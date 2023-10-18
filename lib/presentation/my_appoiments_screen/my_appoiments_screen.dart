import '../../widgets/custom_button.dart';
import '../home_screen_container_screen/controller/custum_bottom_bar_controller.dart';
import '../my_appoiments_screen/widgets/myappoiments_item_widget.dart';
import 'controller/my_appoiments_controller.dart';
import 'models/my_appoiments_model.dart';
import 'models/myappoiments_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';



class MyAppoimentsScreen extends StatefulWidget {
  const MyAppoimentsScreen({Key? key}) : super(key: key);

  @override
  State<MyAppoimentsScreen> createState() => _MyAppoimentsScreenState();
}

class _MyAppoimentsScreenState extends State<MyAppoimentsScreen> {
  CustomBottomBarController customBottomBarController = Get.put(CustomBottomBarController());
  List<MyappoimentsItemModel> myAppoinmentData = MyAppoimentsModel.myappoimentsItemList();
  MyAppoimentsController controller = Get.put(MyAppoimentsController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          SizedBox(
            width: double.maxFinite,
            child: Container(
              padding: getPadding(
                left: 103,
                top: 15,
                right: 103,
                bottom: 15,
              ),
              decoration: AppDecoration.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 3,
                    ),
                    child: Text(
                      "lbl_my_appointment".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtAvenirBlack28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          myAppoinmentData.isEmpty?Column(

            children: [
              CustomImageView(
                  svgPath: ImageConstant.imgCard,
                  height: getSize(140),
                  width: getSize(140)),
              Padding(
                  padding: getPadding(top: 30),
                  child: Text("msg_no_appointment_yet".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtAvenirBlack28)),
              Padding(
                  padding: getPadding(top: 6),
                  child: Text("msg_it_is_a_long_established".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtBody)),
              CustomButton(
                  height: getVerticalSize(54),
                  width: getHorizontalSize(180),
                  text: "lbl_book_now2".tr,
                  margin: getMargin(top: 29, bottom: 202),
                  onTap: () {
                    customBottomBarController.getIndex(0);
                  })
            ],
          ):Expanded(
            child: ListView.separated(
              padding: getPadding(
                left: 16,
                top: 24,
                right: 16,
                bottom: 24
              ),
              primary: false,
              shrinkWrap: true,
              separatorBuilder: (
                  context,
                  index,
                  ) {
                return SizedBox(
                  height: getVerticalSize(
                    16,
                  ),
                );
              },
              itemCount: myAppoinmentData.length,
              itemBuilder: (context, index) {
                MyappoimentsItemModel model = myAppoinmentData[index];
                return MyappoimentsItemWidget(
                  model,
                );
              },
            ),
          ),

        ],
      ),
    );
  }
  onTapBooknow() {
    Get.toNamed(
      AppRoutes.homePageScreen,
    );
  }
}





