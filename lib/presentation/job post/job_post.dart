import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiero_job_seeker/core/colors/colors.dart';
import 'package:hiero_job_seeker/core/constants/constants.dart';
import 'package:hiero_job_seeker/core/widgets/widget.dart';
import 'package:hiero_job_seeker/infrastructure/models/jobmodel.dart';
import 'package:hiero_job_seeker/presentation/home/home_screen.dart';
import 'package:intl/intl.dart';

class JobPostScrn extends StatelessWidget {
  const JobPostScrn({super.key, required this.jobModel});
  final JobModel jobModel;
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
              CircleAvatar(
                  backgroundImage: AssetImage(
                      jobModel.companyImageUrl ?? AppImage.companyPic)),
              sizedBox5W,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobModel.companyName ?? '',
                    style: companyDesignationTitle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    jobModel.title,
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
              JobPostContainerWidget(size: size, jobModel: jobModel),
              sizedBox5H,
              Text('About Job', style: mediumlightTitle),
              sizedBox5H,
              PaddingContainerWidget(
                  color: colorAppLight, child: Text(jobModel.description)),
              sizedBox5H,
              Text('Skills Required', style: mediumlightTitle),
              sizedBox5H,
              PaddingContainerWidget(
                color: colorAppLight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    jobModel.skills.length,
                    (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PaddingContainerWidget(
                          padding: 5,
                          color: colorWhite,
                          child:
                              Text('${index + 1}. ${jobModel.skills[index]}'),
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
              PaddingContainerWidget(
                color: colorAppLight,
                child: JobTileIconWidget(
                    iconData: FontAwesomeIcons.piggyBank,
                    title: 'Annual CTC: ${jobModel.salary} /year'),
              ),
              sizedBox5H,
              Text('Other Details', style: mediumlightTitle),
              sizedBox5H,
              PaddingContainerWidget(
                color: colorAppLight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    JobTileIconWidget(
                        iconData: FontAwesomeIcons.solidCalendarCheck,
                        title:
                            'LAST SUBMISSION :- ${DateFormat('d MMM yyyy').format(jobModel.deadline)}'),
                    sizedBox5H,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        JobTileIconWidget(
                          iconData: FontAwesomeIcons.chair,
                          title:
                              '${jobModel.opportunities} opportunities Posted',
                        ),
                        JobTileIconWidget(
                          iconData: FontAwesomeIcons.userCheck,
                          title: '${jobModel.candidateshired} candidates hired',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              sizedBox10H,
              ElevatedBtnWidget(
                  onPressed: () {}, title: 'POST STATUS', btnColor: colorApp),
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
