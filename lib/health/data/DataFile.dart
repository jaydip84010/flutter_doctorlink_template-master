import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../model/LatestBlogModel.dart';
import '../model/home_screen_data_model.dart';

class DataFile {
  static String idealLink =
      "https://www.calculator.net/ideal-weight-calculator.html";
  static String bmiLink = "https://www.calculator.net/bmi-calculator.html";
  static String bodyFatLink =
      "https://www.calculator.net/body-fat-calculator.html";
  static String caloriesLink =
      "https://www.calculator.net/calorie-calculator.html";
  static String waterIntakeLink =
      "https://www.gigacalculator.com/calculators/water-intake-calculator.php";
  static String targetHeartLink =
      "https://www.calculatorsoup.com/calculators/health/target-heart-rate-zone-calculator.php";
  static String pregnancyLink =
      "https://www.calculator.net/due-date-calculator.html";
  static String ovulationBloodLink =
      "https://www.calculator.net/ovulation-calculator.html";
  static String bloodVolumeLink =
      "https://www.easycalculation.com/medical/blood-volume.php";
  static String bloodDonationLink =
      "https://miniwebtool.com/blood-donation-time-calculator/";
  static String bloodAlcoholLink =
      "https://www.calculator.net/bac-calculator.html";
  static String breathCountLink =
      "https://www.easycalculation.com/health/breath-count.php";
  static String bloodPressureLink =
      "https://www.fortisescorts.in/blood-pressure-calculator";

  static List<String> getLinkList(BuildContext context) {
    return [
      idealLink,
      bmiLink,
      bodyFatLink,
      caloriesLink,
      waterIntakeLink,
      targetHeartLink,
      pregnancyLink,
      ovulationBloodLink,
      bloodVolumeLink,
      bloodDonationLink,
      bloodAlcoholLink,
      breathCountLink,
      bloodPressureLink
    ];
  }

  static List<RowItem> getCategoryModel(BuildContext context) {
    List<String> titleList = getTitleList(context);
    List<String> descList = getDescList(context);
    List<RowItem> list = [];

    for (int i = 0; i < titleList.length; i++) {
      RowItem model = new RowItem();
      model.id = (i + 1);
      model.title = titleList[i];
      model.description = descList[i];
      model.color = getColorList()[i];
      model.pageName = getPageList(context)[i];
      model.resultDesc = getResultDescList(context)[i];
      model.resultText = getResultTextList(context)[i];
      model.pdf = getPdfList(context)[i];
      model.image = getMainIcon(context)[i];
      model.transImage = getTransparentIcon(context)[i];
      model.link = getLinkList(context)[i];

      list.add(model);
    }

    return list;
  }

  static List<String> getPageList(BuildContext context) {
    return [
      "IdealWeightPage",
      "BodyMassPage",
      "BodyFatPage",
      "CaloriesWeightPage",
      "WaterIntakePage",
      "HeartRatePage",
      "PregnancyPage",
      "OvulationPage",
      "BloodVolumePage",
      "BloodDonationPage",
      "BloodAlcoholPage",
      "BreathCountPage",
      "BloodPressurePage"
    ];
  }

  static List<String> getPdfList(BuildContext context) {
    return [
      "ideal_weight_chart.png",
      "chart_new.png",
      "body_fat_chart.png",
      "calorie_chart.png",
      "water_chart.png",
      "heart_chart.png",
      "preg_chart.jpg",
      "ovulation_chart.png",
      "",
      "giving_blood.png",
      "bac.png",
      "",
      ""
    ];
  }

  static List<String> getMainIcon(BuildContext context) {
    return [
      "Body Fat.svg",
      "Body Mass.svg",
      "Body Fat 2.svg",
      "Calories.svg",
      "Water Intake.svg",
      "Target Heart Rate.svg",
      "Pregnancy.svg",
      "Ovulation.svg",
      "Blood volume.svg",
      "Blood donation.svg",
      "Blood Alcohol.svg",
      "Breath Count.svg",
      "Breath Count.svg"
    ];
  }

  static List<String> getTransparentIcon(BuildContext context) {
    return [
      "",
      "body_mass_icon.svg",
      "body_fat.svg",
      "calories_icon.svg",
      "water_intake_icon.svg",
      "target_heart_icon.svg",
      "pregnancy_icon.svg",
      "ovulation_period_icon.svg",
      "blood_volume_icon.svg",
      "blood_donation_icon.svg",
      "blood_alcohol_icon.svg",
      "breath_count_icon.svg",
      "breath_count_icon.svg"
    ];
  }

  static List<HomeScreenData> getHomeData() {
    return [
      HomeScreenData(
        "Ideal Weight.svg",
        "Ideal weight",
      ),
      HomeScreenData(
        "Body Mass.svg",
        "Body mass index",
      ),
      HomeScreenData(
        "Body Fat 2.svg",
        "Body fat",
      ),
      HomeScreenData(
        "Calories.svg",
        "Calorias for Weight Gain/Loss",
      ),
      HomeScreenData(
        "Water Intake.svg",
        "Water intake",
      ),
      HomeScreenData(
        "Target Heart Rate.svg",
        "Target heart",
      ),
      HomeScreenData(
        "Pregnancy.svg",
        "Pregnancy duration",
      ),
      HomeScreenData(
        "Ovulation.svg",
        "Ovulation period",
      ),
      HomeScreenData(
        "Blood volume.svg",
        "Blood volume",
      ),
      HomeScreenData(
        "Blood donation.svg",
        "Blood donation",
      ),
      HomeScreenData(
        "Blood Alcohol.svg",
        "Blood alcohol",
      ),
      HomeScreenData(
        "Breath Count.svg",
        "Breath count",
      ),
    ];
  }

  static List<String> getResultTextList(BuildContext context) {
    return [
      S.of(context).yourIdealWeightIs,
      S.of(context).yourBodyMassIndexIs,
      S.of(context).yourEstimatedBodyFatPercentageIs,
      S.of(context).youEstimatedDailyCaloricNeedIs,
      S.of(context).yourDailyWaterRequirementIs,
      S.of(context).yourMaximumHeartRateIs,
      S.of(context).yourExpectedDeliveryDateIs,
      S.of(context).yourUpcomingMostFertileDaysAre,
      S.of(context).yourTotalBloodVolumeIs,
      S.of(context).yourNextEligibleDateIs,
      S.of(context).yourBloodAlcoholContentIs,
      S.of(context).numberOfBreathsYouHaveTaken,
      S.of(context).yourBloodPressureIs
    ];
  }

  static List<String> getResultDescList(BuildContext context) {
    return [
      S.of(context).resultDesc1,
      S.of(context).resultDesc2,
      S.of(context).resultDesc3,
      S.of(context).resultDesc4,
      S.of(context).resultDesc5,
      S.of(context).resultDesc6,
      S.of(context).resultDesc7,
      S.of(context).resultDesc8,
      "",
      S.of(context).resultDesc10,
      S.of(context).resultDesc11,
      "",
      ""
    ];
  }

  static List<String> getTitleList(BuildContext context) {
    return [
      S.of(context).idealWeight,
      S.of(context).bodyMassIndex,
      S.of(context).bodyFat,
      S.of(context).caloriesForWeightGainloss,
      S.of(context).waterIntake,
      S.of(context).targetHeartRate,
      S.of(context).pregnancyDueDate,
      S.of(context).ovulationPeriod,
      S.of(context).bloodVolume,
      S.of(context).bloodDonation,
      S.of(context).bloodAlcohol,
      S.of(context).breathCount,
      S.of(context).bloodPressure
    ];
  }

  static List<String> getDescList(BuildContext context) {
    return [
      S.of(context).desc1,
      S.of(context).desc2,
      S.of(context).desc3,
      S.of(context).desc4,
      S.of(context).desc5,
      S.of(context).desc6,
      S.of(context).desc7,
      S.of(context).desc8,
      S.of(context).desc9,
      S.of(context).desc9,
      S.of(context).desc10,
      S.of(context).desc11,
      S.of(context).desc12
    ];
  }

  static List<Color> getColorList() {
    return [
      ConstantData.idealweightColor,
      ConstantData.bodymassindexColor,
      ConstantData.bodyfatColor,
      ConstantData.caloriasColor,
      ConstantData.waterintakeColor,
      ConstantData.targetheartColor,
      ConstantData.pregnancydurationColor,
      ConstantData.ovulationperiodColor,
      ConstantData.bloodvolumeColor,
      ConstantData.blooddonationColor,
      ConstantData.bloodalcoholColor,
      ConstantData.breathcountColor,
      ConstantData.color13,
      ConstantData.color14,
      ConstantData.color15
    ];
  }

  static List<LatestBlogModel> getAllLatestData(BuildContext context) {
    List<LatestBlogModel> list = [];
    list.add(LatestBlogModel("blog1.png", S.of(context).blog1, ""));
    list.add(LatestBlogModel("blog2.png", S.of(context).blog2, ""));
    list.add(LatestBlogModel("blog3.png", S.of(context).blog3, ""));
    list.add(LatestBlogModel("blog4.webp", S.of(context).blog4, ""));
    list.add(LatestBlogModel("blog5.webp", S.of(context).blog5, ""));
    list.add(LatestBlogModel("blog6.webp", S.of(context).blog6, ""));
    list.add(LatestBlogModel("blog7.webp", S.of(context).blog7, ""));

    return list;
  }
}
