import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiero_job_seeker/core/colors/colors.dart';
import 'package:hiero_job_seeker/core/constants/constants.dart';
import 'package:hiero_job_seeker/core/widgets/widget.dart';
import 'package:hiero_job_seeker/presentation/chat/chat_message.dart';

class ChatScrn extends StatelessWidget {
  const ChatScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Chat', style: mediumTitle),
                        const Spacer(),
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: colorAppLight,
                          child: FaIcon(FontAwesomeIcons.battleNet),
                        ),
                        sizedBox5W,
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: colorAppLight,
                          child: FaIcon(CupertinoIcons.search),
                        )
                      ],
                    ),
                    sizedBox10H,
                    SegmentedTabControl(
                      barDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      tabTextColor: colorApp,
                      selectedTabTextColor: Colors.white,
                      squeezeIntensity: 2,
                      tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                      indicatorDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      textStyle:
                          GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      tabs: const [
                        SegmentTab(
                          label: 'Job',
                          color: colorApp,
                          backgroundColor: colorAppLight,
                        ),
                        SegmentTab(
                          label: 'Personal',
                          backgroundColor: colorAppLight,
                          color: colorApp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 130),
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    CompanyMessageTile(),
                    PersonalMessageTile(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyMessageTile extends StatelessWidget {
  const CompanyMessageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        alignment: Alignment.center,
        child: ListView(children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ChatMessageScrn(),
              ));
            },
            child: PaddingContainerWidget(
                padding: 10,
                color: colorAppLight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/th.jpeg'),
                    ),
                    sizedBox5W,
                    SizedBox(
                      width: size.width - 191,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Axonet Emsys Private Limited',
                              style: companyDesignationTitle,
                              overflow: TextOverflow.ellipsis),
                          Text('Flutter Developer',
                              style: mediumsubTitle,
                              overflow: TextOverflow.ellipsis),
                          Text('Hai Sir,',
                              style: companyNameTitle,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    const PaddingContainerWidget(
                      isNewcolor: colorAppLight,
                      isNew: true,
                      width: 81,
                      padding: 4,
                      color: colorWhite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FaIcon(FontAwesomeIcons.lightbulb, size: 16),
                          Text(
                            'In-touch  ',
                            style: TextStyle(
                                color: colorApp, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )
        ]),
      ),
    );
  }
}

class PersonalMessageTile extends StatelessWidget {
  const PersonalMessageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChatMessageScrn(),
                ));
              },
              child: PaddingContainerWidget(
                padding: 10,
                color: colorAppLight,
                isNew: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    sizedBox5W,
                    SizedBox(
                      width: size.width - 191,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Adithyan R',
                              style: companyDesignationTitle,
                              overflow: TextOverflow.ellipsis),
                          Text('Flutter Developer',
                              style: mediumsubTitle,
                              overflow: TextOverflow.ellipsis),
                          Text('Hai Sir,',
                              style: companyNameTitle,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
