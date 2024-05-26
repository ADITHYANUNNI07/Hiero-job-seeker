import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiero_job_seeker/core/colors/colors.dart';
import 'package:hiero_job_seeker/core/constants/constants.dart';
import 'package:hiero_job_seeker/core/widgets/widget.dart';
import 'package:hiero_job_seeker/presentation/home/home_screen.dart';

List<String> skillList = [
  'Effective Communication',
  'Sales',
  'English Proficiency (Written)',
];

class JobPostScrn extends StatelessWidget {
  const JobPostScrn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TopColorSafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFBF8FE),
          elevation: 0,
          foregroundColor: colorApp,
          titleSpacing: 0,
          title: Row(
            children: [
              const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/th.jpeg')),
              sizedBox5W,
              Column(
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
              )
            ],
          ),
          actions: const [
            Center(
              child: FaIcon(Icons.more_vert),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            children: [
              JobPostContainerWidget(size: size),
              sizedBox5H,
              Text('About Job', style: mediumlightTitle),
              sizedBox5H,
              const PaddingContainerWidget(
                  color: colorAppLight,
                  child: Text(
                      '1. Handle B2B customer communication\n2. Talking to existing/new customers and getting leads from them\n3. Conduct website user demos\n4. Making sure that the daily reports to clients go out on time\n5. Reporting directly to the head of marketing and sales\n6. Give feedback and manage quality of content creation teams to meet client standards\n7. Understand our services through Data Entry process in each department')),
              sizedBox5H,
              Text('Skills Required', style: mediumlightTitle),
              sizedBox5H,
              PaddingContainerWidget(
                color: colorAppLight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    skillList.length,
                    (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PaddingContainerWidget(
                          padding: 5,
                          color: colorWhite,
                          child: Text('${index + 1}. ${skillList[index]}'),
                        ),
                        sizedBox5H,
                      ],
                    ),
                  ),
                ),
              ),
              sizedBox5H,
              Text('Salary', style: mediumlightTitle),
              sizedBox5H,
              const PaddingContainerWidget(
                color: colorAppLight,
                child: JobTileIconWidget(
                    iconData: FontAwesomeIcons.piggyBank,
                    title: 'Annual CTC: ₹ 3,00,000 - 5,40,000 /year'),
              ),
              sizedBox5H,
              Text('Other Details', style: mediumlightTitle),
              sizedBox5H,
              const PaddingContainerWidget(
                color: colorAppLight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    JobTileIconWidget(
                        iconData: FontAwesomeIcons.solidCalendarCheck,
                        title: 'LAST SUBMISSION :- 21 Sept 2024'),
                    sizedBox5H,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        JobTileIconWidget(
                          iconData: FontAwesomeIcons.chair,
                          title: '58 opportunities Posted',
                        ),
                        JobTileIconWidget(
                          iconData: FontAwesomeIcons.userCheck,
                          title: '4 candidates hired',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              sizedBox10H,
              ElevatedBtnWidget(
                  onPressed: () {}, title: 'APPLY NOW', btnColor: colorApp),
              sizedBox5H
            ],
          ),
        ),
      ),
    );
  }
}

class JobTileIconWidget extends StatelessWidget {
  const JobTileIconWidget({
    super.key,
    required this.title,
    required this.iconData,
  });
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return PaddingContainerWidget(
      padding: 5,
      color: colorWhite,
      child: Row(
        children: [
          FaIcon(iconData, size: 15),
          sizedBox5W,
          Text(title),
        ],
      ),
    );
  }
}
