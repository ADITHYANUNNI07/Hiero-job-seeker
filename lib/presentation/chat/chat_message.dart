import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiero_job_seeker/core/colors/colors.dart';
import 'package:hiero_job_seeker/core/constants/constants.dart';
import 'package:hiero_job_seeker/core/widgets/widget.dart';

class ChatMessageScrn extends StatelessWidget {
  const ChatMessageScrn({super.key, this.isUser = false});
  final bool isUser;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TopColorSafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFBF8FE),
          elevation: 0.2,
          foregroundColor: colorApp,
          titleSpacing: 0,
          title: Row(
            children: [
              const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/th.jpeg')),
              sizedBox5W,
              SizedBox(
                width: isUser ? size.width - 200 : size.width - 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Finari Services Private Limited',
                      style: companyDesignationTitle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Community Management',
                      style: companyNameTitle,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
          actions: [
            isUser
                ? const Center(child: FaIcon(FontAwesomeIcons.phone, size: 20))
                : Container(),
            isUser ? sizedBox15W : Container(),
            isUser
                ? const Center(child: FaIcon(FontAwesomeIcons.video, size: 20))
                : Container(),
            isUser ? sizedBox10W : Container(),
            const Center(child: FaIcon(Icons.more_vert)),
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 250),
                        child: const PaddingContainerWidget(
                            color: Color(0xFFF1EFF2),
                            child: Column(
                              children: [
                                Text(
                                  'Dear Candidate,\nYou have been shortlisted for the initial round of interview. Please share your updated CV for the further process. Also please share if you are available for full time internship as we are not offering a part-time one.\nRegards',
                                  textAlign: TextAlign.justify,
                                ),
                                sizedBox5H,
                                Row(
                                  children: [
                                    Text(
                                      '1:08 PM',
                                      style: TextStyle(
                                          color: colorGrey, fontSize: 12),
                                    ),
                                    Spacer(),
                                    FaIcon(FontAwesomeIcons.check, size: 12)
                                  ],
                                )
                              ],
                            )),
                      )
                    ],
                  )
                ],
              ),
            )),
            _buildMessageInput(size),
          ],
        ),
      ),
    );
  }
}

Widget _buildMessageInput(Size size) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 9),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          const Expanded(
              child: TextFormWidget(
            isNolabel: true,
            isSearchFilter: true,
            hintText: 'Messages',
            icon: FontAwesomeIcons.comments,
            radiusMessage: 30,
          )),
          sizedBox5W,
          CircleAvatar(
            radius: 23,
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.paperPlane),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ),
  );
}
