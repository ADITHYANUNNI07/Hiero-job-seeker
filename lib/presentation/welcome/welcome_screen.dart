import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiero_job_seeker/core/colors/colors.dart';
import 'package:hiero_job_seeker/core/widgets/widget.dart';
import 'package:hiero_job_seeker/presentation/login/login_screen.dart';
import 'package:hiero_job_seeker/presentation/signup/signup_screen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScrn extends StatefulWidget {
  const WelcomeScrn({super.key});

  @override
  State<WelcomeScrn> createState() => _WelcomeScrnState();
}

final liqController = LiquidController();

int currentPage = 0;

class _WelcomeScrnState extends State<WelcomeScrn> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TopColorSafeArea(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Stack(
              children: [
                LiquidSwipe(
                  onPageChangeCallback: onPageChangedCallback,
                  liquidController: liqController,
                  pages: [
                    Container(
                      color: Colors.white,
                      width: size.width,
                      child: Column(
                        children: [
                          SizedBox(height: size.height / 8.9),
                          Image.asset(
                            'assets/images/welcome1.png',
                            height: size.height / 2.8,
                          ),
                          SizedBox(height: size.height / 8.9),
                          Column(
                            children: [
                              Text(
                                "Welcome to Hiero",
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "Job Portal",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "“Your career is your business. It's time to manage it like one.”",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0XFF4b4b4b),
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: size.width,
                      child: Column(
                        children: [
                          SizedBox(height: size.height / 8.9),
                          Image.asset(
                            'assets/images/welcome2.png',
                            height: size.height / 2.8,
                          ),
                          SizedBox(height: size.height / 8.9),
                          Column(
                            children: [
                              Text(
                                "\"The future depends on what you do today.\"",
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "\"The only way to do great work is to love what you do.\"\n - Steve Jobs\"",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0XFF4b4b4b),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: size.width,
                      child: Column(
                        children: [
                          SizedBox(height: size.height / 8.9),
                          Image.asset(
                            'assets/images/welcome3.png',
                            height: size.height / 2.8,
                          ),
                          SizedBox(height: size.height / 8.9),
                          Column(
                            children: [
                              Text(
                                "\"Your career is your business. It's time to manage it like one.\"",
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "\"Success usually comes to those who are too busy to be looking for it.\" - Henry David Thoreau",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0XFF4b4b4b),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                currentPage != 2
                    ? Positioned(
                        top: 40,
                        right: 10,
                        child: TextButton(
                          onPressed: () {
                            int nextPage = liqController.currentPage + 2;
                            liqController.animateToPage(page: nextPage);
                          },
                          child: Text(
                            'Skip',
                            style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 16, 16, 16),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                Positioned(
                  bottom: size.height / 6,
                  left: 0,
                  right: 0,
                  child: FractionallySizedBox(
                    widthFactor: 0.2,
                    child: AnimatedSmoothIndicator(
                      activeIndex: liqController.currentPage,
                      count: 3,
                      effect: const WormEffect(
                        dotColor: Color.fromARGB(255, 238, 230, 230),
                        activeDotColor: colorApp,
                        dotHeight: 5,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height / 1.3,
                  child: SizedBox(
                    width: size.width - 40,
                    height: 50,
                    child: ElevatedBtnWidget(
                      title: currentPage != 2 ? 'NEXT' : 'CREATE AN ACCOUNT',
                      btnColor: colorApp,
                      onPressed: () {
                        if (currentPage != 2) {
                          int nextPage = liqController.currentPage + 1;
                          liqController.animateToPage(page: nextPage);
                        } else {
                          Get.off(() => SignupScreen());
                        }
                      },
                    ),
                  ),
                ),
                currentPage == 2
                    ? Positioned(
                        top: size.height / 1.18,
                        child: SizedBox(
                          width: size.width - 40,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  side: const BorderSide(color: colorApp),
                                ),
                                foregroundColor: colorApp),
                            child: Text(
                              'LOGIN',
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPageChangedCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
