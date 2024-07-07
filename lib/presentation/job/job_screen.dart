import 'package:flutter/material.dart';
import 'package:hiero_job_seeker/core/constants/constants.dart';
import 'package:hiero_job_seeker/core/widgets/widget.dart';
import 'package:hiero_job_seeker/infrastructure/models/jobmodel.dart';
import 'package:hiero_job_seeker/presentation/home/home_screen.dart';

class JobScrn extends StatelessWidget {
  const JobScrn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TopColorSafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox10H,
              Text('Job', style: mediumTitle),
              sizedBox10H,
              SearchFilterWidget(
                size: size,
                onTap: () {
                  JobFilterAlertBox.show(context, size);
                },
              ),
              sizedBox10H,
              Expanded(
                child: ListView(
                  children: List.generate(
                    10,
                    (index) =>
                        JobPostContainerWidget(size: size, jobModel: jobModel),
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
