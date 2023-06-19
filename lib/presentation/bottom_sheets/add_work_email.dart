import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../commons/app_colors.dart';
import '../commons/app_images.dart';
import '../commons/utils.dart';

class AddWorkEmailBottomSheet extends StatefulWidget {
  const AddWorkEmailBottomSheet({super.key});

  @override
  _AddWorkEmailBottomSheetState createState() =>
      _AddWorkEmailBottomSheetState();
}

class _AddWorkEmailBottomSheetState extends State<AddWorkEmailBottomSheet> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // Implement the build method to return the desired UI for the BottomSheet
    return Container(
      color: Colors.transparent,
      child: Card(
        margin: const EdgeInsets.only(
            top: 10, bottom: 5, left: 20, right: 20),
        elevation: 8,
        shadowColor: Colors.white30,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: 0.0, left: 18.0, right: 18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pay with Vipps',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        // moveBack(context);
                      },
                      child: Card(
                        color: AppColors.whiteColor,
                        elevation: 5.0,
                        shadowColor: AppColors.lightGreyColor,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(45))),
                        child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: SvgPicture.asset(AppImages.cross_icon)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    width: screenSize.width,
                    child: Row(
                      children: [
                        Checkbox(
                          value: value,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                        Container(
                            width: screenSize.width * .6,
                            child: Text(Utils.terms_and_condition))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: value,
                        onChanged: (bool? value) {
                          setState(() {
                            this.value = value!;
                          });
                        },
                      ),
                      Container(
                          width: screenSize.width * .6,
                          child: Text(Utils.terms_and_condition1))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                color: AppColors.transparentColor,
                width: screenSize.width,
                height: screenSize.height * .06,
                child: GestureDetector(
                  onTap: () {
                    // openVippsApp(context);
                  },
                  child: const Card(
                    color: AppColors.activeColorPrimary,
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    elevation: 5.0,
                    shadowColor: Colors.white30,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(45))),
                    child: Center(
                        child: Text(
                      '\$ 20.00 - Pay with vipps',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
