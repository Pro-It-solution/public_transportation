import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:new_app00/controller/controller_ocr.dart';
import 'package:new_app00/widgets/textfield.dart';
import 'package:new_app00/widgets/w_button.dart';
import 'package:new_app00/widgets/widget_image.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/controller_upload_car_number.dart';
import '../widgets/w_bottom_sheet.dart';

//answer view
class ViewHome extends StatelessWidget {
  const ViewHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CUploadCar carnumber = Provider.of<CUploadCar>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          const WidgetImage(),
          Consumer<ControllerOCR>(
              builder: (context, value, child) =>
                  Text("color number" + (value.ocr.carNumber ?? ""))),
          WidgetTextField(
            labelText: "car number",
            onChanged: (p0) {
              carnumber.salad.setcarNumber(p0);
              print(carnumber.salad.getcarNumber);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          WidgetBtn(
            title: "اضافة",
            onTap: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();

              carnumber.salad.setuserPhone(prefs.get("phoneNumber"));
              carnumber.salad.setID(prefs.get("nationality") as String);
              CUploadCar upload =
                  Provider.of<CUploadCar>(context, listen: false);

              upload.upload(context);
              showFlexibleBottomSheet(
                  context: context,
                  builder: (context, scrollController, bottomSheetOffset) =>
                      const WidgetDesignBottomSheet());
            },
          )
        ]),
      ),
    );
  }
}
