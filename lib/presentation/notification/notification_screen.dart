import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiero_job_seeker/core/colors/colors.dart';
import 'package:hiero_job_seeker/core/constants/constants.dart';
import 'package:hiero_job_seeker/core/widgets/widget.dart';

class NotificationScrn extends StatelessWidget {
  const NotificationScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return TopColorSafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            children: [
              sizedBox10H,
              Text('Notifications', style: mediumTitle),
              sizedBox10H,
              PaddingContainerWidget(
                color: colorAppLight,
                isNew: true,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                    ),
                    sizedBox5W,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Modelyn Saris\n',
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: colorBlack),
                          ),
                          TextSpan(
                            text: 'is now following you\n',
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                                color: colorBlack),
                          ),
                          TextSpan(
                            text: '15 min ago',
                            style: GoogleFonts.poppins(
                                fontSize: 9,
                                fontWeight: FontWeight.normal,
                                color: colorGrey),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    ElevatedBtnWidget(
                      onPressed: () {},
                      title: 'FOLLOW',
                      borderColor: colorApp,
                      btnColor: colorAppLight,
                      titleColor: colorApp,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
