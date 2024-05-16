import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiero_job_seeker/domain/core/colors/colors.dart';
import 'package:hiero_job_seeker/domain/core/constants/constants.dart';
import 'package:hiero_job_seeker/domain/core/widgets/widget.dart';
import 'package:hiero_job_seeker/presentation/job%20post/job_post.dart';
import 'package:lottie/lottie.dart';

class HomeScrn extends StatelessWidget {
  const HomeScrn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PaddingContainerWidget(
                    color: colorApp,
                    child: Icon(CupertinoIcons.text_badge_star,
                        color: Colors.white)),
                sizedBox10W,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Adithyan R', style: mediumTitle),
                    Text('Flutter Developer', style: mediumsubTitle),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                )
              ],
            ),
          ),
          sizedBox10H,
          SearchFilterWidget(
            size: size,
            onTap: () {
              JobFilterAlertBox.show(context, size);
            },
          ),
          sizedBox10H,
          const RowMainTitleWidget(title: 'Recent Job'),
          sizedBox10H,
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const JobPostScrn(),
                ),
              );
            },
            child: JobPostContainerWidget(size: size),
          ),
          sizedBox10H,
          const RowMainTitleWidget(title: 'Recent Internship'),
          sizedBox10H,
          PaddingContainerWidget(
            color: colorInternshipAppLight,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/th.jpeg'),
                        radius: 30),
                    sizedBox10W,
                    SizedBox(
                      height: 60,
                      width: size.width - 114 - 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Community Management',
                            style: companyDesignationTitle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Finari Services Private Limited',
                            style: companyNameTitle,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    const TimeDurationContainerWidget(
                      title: 'NOW',
                      color: colorInternshipApp,
                      lightColor: colorInternshipAppLight,
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PaddingContainerWidget(
                      padding: 8,
                      color: colorWhite,
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.house,
                            size: 15,
                            color: colorInternshipApp,
                          ),
                          sizedBox10W,
                          Text('Work from home')
                        ],
                      ),
                    ),
                  ],
                ),
                sizedBox15H,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    JobSDateExpWidget(
                        iconData: FontAwesomeIcons.play,
                        title: 'START DATE',
                        subtitle: 'Immediately',
                        color: colorInternshipApp),
                    JobSDateExpWidget(
                        iconData: FontAwesomeIcons.calendarDay,
                        title: 'DURATION',
                        subtitle: '1-5 Months',
                        color: colorInternshipApp),
                    JobSDateExpWidget(
                        iconData: FontAwesomeIcons.piggyBank,
                        title: 'STIPEND',
                        subtitle: '₹ 8 - 15 k',
                        color: colorInternshipApp),
                  ],
                ),
                sizedBox15H,
              ],
            ),
          ),
          sizedBox10H,
          const RowMainTitleWidget(title: 'Connections'),
          sizedBox10H,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaddingContainerWidget(
                  width: size.width / 2,
                  color: colorWhite,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                        radius: 60,
                      ),
                      sizedBox10H,
                      Text('Adithyan R', style: companyDesignationTitle),
                      Text('Flutter Developer', style: companyNameTitle),
                      sizedBox5H,
                      const PaddingContainerWidget(
                        padding: 6,
                        color: colorAppLight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.battleNet),
                            sizedBox5W,
                            Text('102 Connections',
                                style: TextStyle(color: colorApp)),
                          ],
                        ),
                      ),
                      sizedBox10H,
                      const PaddingContainerWidget(
                          width: double.infinity,
                          color: colorApp,
                          child: Center(
                            child: Text(
                              'FOLLOW',
                              style: TextStyle(
                                color: colorWhite,
                              ),
                            ),
                          ))
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class JobPostContainerWidget extends StatelessWidget {
  const JobPostContainerWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PaddingContainerWidget(
      color: colorAppLight,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/th.jpeg'),
                  radius: 30),
              sizedBox10W,
              SizedBox(
                height: 60,
                width: size.width - 114 - 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Community Management',
                      style: companyDesignationTitle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Finari Services Private Limited',
                      style: companyNameTitle,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              const Spacer(),
              const TimeDurationContainerWidget(
                title: 'NOW',
                color: colorApp,
                lightColor: colorAppLight,
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PaddingContainerWidget(
                padding: 8,
                color: colorWhite,
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.house, size: 15),
                    sizedBox10W,
                    Text('Work from home')
                  ],
                ),
              ),
            ],
          ),
          sizedBox15H,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              JobSDateExpWidget(
                  iconData: FontAwesomeIcons.play,
                  title: 'START DATE',
                  subtitle: 'Immediately',
                  color: colorApp),
              JobSDateExpWidget(
                  iconData: FontAwesomeIcons.calendarDay,
                  title: 'EXPERIENCE',
                  subtitle: '1-5 Years',
                  color: colorApp),
              JobSDateExpWidget(
                  iconData: FontAwesomeIcons.piggyBank,
                  title: 'CTC(Annual)',
                  subtitle: '₹ 3 - 5 L',
                  color: colorApp),
            ],
          ),
          sizedBox15H,
        ],
      ),
    );
  }
}

class RowMainTitleWidget extends StatelessWidget {
  const RowMainTitleWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: mediumlightTitle),
        const Spacer(),
        CircleAvatar(
          backgroundColor: colorAppLight,
          child: LottieBuilder.asset('assets/animations/vED6TkFKA5.json'),
        )
      ],
    );
  }
}

class JobSDateExpWidget extends StatelessWidget {
  const JobSDateExpWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.color,
  });
  final IconData iconData;
  final String title;
  final String subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FaIcon(iconData, size: 15, color: colorGreyjob),
        sizedBox5W,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              subtitle,
              style: TextStyle(color: color),
            )
          ],
        )
      ],
    );
  }
}

class TimeDurationContainerWidget extends StatelessWidget {
  const TimeDurationContainerWidget({
    super.key,
    required this.title,
    required this.color,
    required this.lightColor,
  });
  final String title;
  final Color color;
  final Color lightColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: 60,
          height: 35,
        ),
        Positioned(
          bottom: 1,
          child: Container(
            width: 55,
            height: 30,
            decoration: BoxDecoration(
                color: colorWhite, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold, color: color),
              ),
            ),
          ),
        ),
        Positioned(
            right: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: colorAppLight,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ))
      ],
    );
  }
}

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({
    super.key,
    required this.size,
    required this.onTap,
  });

  final Size size;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: size.width * 0.8,
          child: const TextFormWidget(
              label: 'Search Job/Internship',
              icon: CupertinoIcons.search,
              isNolabel: true,
              isSearchFilter: true),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            color: colorWhite,
            height: 59,
            child: const PaddingContainerWidget(
                color: colorApp,
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: FaIcon(
                    FontAwesomeIcons.filter,
                    color: colorWhite,
                  ),
                )),
          ),
        )
      ],
    );
  }
}
