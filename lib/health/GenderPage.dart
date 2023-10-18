import 'package:flutter/material.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/PrefData.dart';

import 'package:doctorapp/generated/l10n.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return  _GenderPage();
  }
}

class _GenderPage extends State<GenderPage> {




  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }


  bool isMale = true;


  TextEditingController ageController = new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setGender();




  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = [];
    for (String fruit in fruits) {
      items.add(new DropdownMenuItem(value: fruit, child: new Text(fruit)));
    }
    return items;
  }

  setGender() async {
    int gender = await PrefData.getGender();
    int age = await PrefData.getAge();
    ageController.text = age.toString();

    if (gender == 0) {
      isMale = true;
    } else {
      isMale = false;
    }
    setState(() {});
  }

  saveData(){
    if (isMale) {
      PrefData.setGender(0);
    } else {
      PrefData.setGender(1);
    }


    int age = 0;
    if (ConstantData.check(ageController.text)) {
      age = int.parse(ageController.text);
    }

    PrefData.setAge(age);

    _requestPop();
  }

  @override
  Widget build(BuildContext context) {
    double margin = ConstantWidget.getScreenPercentSize(context, 3);
    double circle = ConstantWidget.getScreenPercentSize(context, 15);


    return WillPopScope(
      child: Scaffold(
        backgroundColor: ConstantData.bgColor,


        bottomNavigationBar:
            ConstantWidget.getBottomButton(context, S.of(context).done, () {
        saveData();
        }),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(margin),
          padding: EdgeInsets.symmetric(vertical: margin),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ConstantWidget.getScreenPercentSize(context, 3),
              ),
              Container(
                  height: circle,
                  width: circle,
                  decoration: BoxDecoration(
                    color: ConstantData.accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      ConstantData.assetsPath + "gender_icon.png",
                      color: Colors.white,
                      height: ConstantWidget.getPercentSize(circle, 50),
                    ),
                  )),
              SizedBox(
                height: ConstantWidget.getScreenPercentSize(context, 3),
              ),
              ConstantWidget.getDefaultTextWidget(
                  S.of(context).selectGender,
                  TextAlign.center,
                  FontWeight.w700,
                  ConstantWidget.getScreenPercentSize(context, 3),
                  ConstantData.textColor),
              SizedBox(
                height: ConstantWidget.getScreenPercentSize(context, 1),
              ),
              ConstantWidget.getDefaultTextWidget(
                  S.of(context).pleaseSelectYourGender,
                  TextAlign.center,
                  FontWeight.w300,
                  ConstantWidget.getScreenPercentSize(context, 1.5),
                  ConstantData.textColor),

              new Spacer(),
              Row(
                children: [
                  getWidget(
                      "male.png", S.of(context).male, isMale ? true : false,
                      () {
                        print("click===true");
                    setState(() {
                      isMale = true;
                    });
                  }),
                  SizedBox(
                    width: ConstantWidget.getWidthPercentSize(context, 2),
                  ),
                  getWidget(
                      "female.png", S.of(context).female, isMale ? false : true,
                      () {
                    setState(() {
                      isMale = false;
                    });
                  }),
                ],
              )
            ],
          ),

        ),
      ),
      onWillPop: _requestPop,
    );
  }

  getWidget(String icon, String name, bool selected, Function function) {
    double height = ConstantWidget.getScreenPercentSize(context, 25);
    double margin = ConstantWidget.getWidthPercentSize(context, 1);
    double subRadius = ConstantWidget.getWidthPercentSize(context, 2);

    double imgHeight = ConstantWidget.getPercentSize(height, 40);

    return Expanded(
      child: InkWell(
        child: Container(
          height: height,
          margin: EdgeInsets.symmetric(horizontal: margin),

          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10,
                )
              ],
              color: Colors.white,
              border: Border.all(
                  width: ConstantWidget.getPercentSize(height, 1),
                  color: (selected) ? ConstantData.accentColor : Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(subRadius))),


          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: imgHeight,
                  decoration: BoxDecoration(
                    color: ConstantData.accentColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                      )
                    ],


                  ),
                  child: Center(
                    child: Image.asset(
                      ConstantData.assetsPath + icon,
                      height: ConstantWidget.getPercentSize(imgHeight, 70),
                    ),
                  )),
              SizedBox(
                height: ConstantWidget.getPercentSize(height, 5),
              ),
              ConstantWidget.getDefaultTextWidget(
                  name,
                  TextAlign.center,
                  FontWeight.w500,
                  ConstantWidget.getPercentSize(height, 8),
                  ConstantData.textColor),
            ],
          ),
        ),
        onTap: (){
          print("click===true111");

          function();
        },
      ),
      flex: 1,
    );
  }
}
