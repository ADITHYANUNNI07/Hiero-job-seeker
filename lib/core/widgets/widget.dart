import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiero_job_seeker/core/colors/colors.dart';
import 'package:hiero_job_seeker/core/constants/constants.dart';
import 'package:hiero_job_seeker/core/provider/provider.dart';
import 'package:hiero_job_seeker/core/widgets/textfields.dart';
import 'package:provider/provider.dart';

class TopColorSafeArea extends StatelessWidget {
  const TopColorSafeArea({super.key, this.child, this.color});
  final Widget? child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? colorApp,
      child: child,
    );
  }
}

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    this.label,
    this.controller,
    this.validator,
    required this.icon,
    this.suffixicon,
    this.suffixOnpress,
    this.obscurebool = false,
    this.onChanged,
    this.hintText,
    this.keyboardType,
    this.suffixIconColor,
    this.maxLines,
    this.suffix,
    this.isNolabel = false,
    this.isSearchFilter = false,
    this.radiusMessage,
  });
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData icon;
  final IconData? suffixicon;
  final void Function()? suffixOnpress;
  final void Function(String?)? onChanged;
  final bool obscurebool;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Widget? suffix;
  final bool isNolabel;
  final bool isSearchFilter;
  final double? radiusMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !isNolabel ? sizedBox15H : Container(),
        !isNolabel
            ? Text(
                label ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )
            : Container(),
        !isNolabel ? sizedBox10H : Container(),
        TextFormField(
          keyboardType: keyboardType,
          style: const TextStyle(color: colorBlack),
          onChanged: onChanged,
          obscureText: obscurebool,
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            suffix: suffix,
            filled: true,
            fillColor: colorWhite,
            suffixIcon: IconButton(
              onPressed: suffixOnpress,
              icon: Icon(suffixicon, color: suffixIconColor),
            ),
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(icon),
              ],
            ),
            labelText: label,
            hintText: hintText,
            focusedBorder: isSearchFilter
                ? null
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: colorApp),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
            border: OutlineInputBorder(
              borderRadius: isSearchFilter
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(radiusMessage ?? 5),
                      topLeft: Radius.circular(radiusMessage ?? 5),
                      bottomRight: Radius.circular(radiusMessage ?? 0),
                      topRight: Radius.circular(radiusMessage ?? 0))
                  : const BorderRadius.all(Radius.circular(5)),
              borderSide: isSearchFilter ? BorderSide.none : const BorderSide(),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
//============================================ElevatedBtn=========================================================

class ElevatedBtnWidget extends StatelessWidget {
  const ElevatedBtnWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.btnColor,
    this.borderColor,
    this.leading,
    this.titleColor,
    this.padding,
    this.elevation,
    this.borderRadius,
  });
  final void Function()? onPressed;
  final String title;
  final Color? btnColor;
  final Color? borderColor;
  final Widget? leading;
  final Color? titleColor;
  final double? padding;
  final double? elevation;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding == null
            ? const EdgeInsets.all(9)
            : EdgeInsets.all(padding!),
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        backgroundColor: btnColor ?? Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leading ?? Container(),
          leading != null ? sizedBox10W : Container(),
          Text(
            title,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: titleColor ?? colorWhite),
          ),
        ],
      ),
    );
  }
}

class PaddingContainerWidget extends StatelessWidget {
  const PaddingContainerWidget({
    super.key,
    required this.child,
    required this.color,
    this.padding,
    this.width,
    this.isNew = false,
    this.isNewcolor,
  });
  final bool isNew;
  final Widget? child;
  final Color? color;
  final Color? isNewcolor;
  final double? padding;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return isNew
        ? Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 5, right: 5),
                child: Container(
                    width: width,
                    padding: EdgeInsets.all(padding ?? 12),
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(10)),
                    child: child),
              ),
              Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: isNewcolor ?? scaffoldBackgroundColor,
                    child: const CircleAvatar(radius: 7),
                  )),
            ],
          )
        : Container(
            width: width,
            padding: EdgeInsets.all(padding ?? 12),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            child: child);
  }
}

class JobFilterAlertBox extends StatefulWidget {
  const JobFilterAlertBox({super.key});
  static show(BuildContext context, size) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
            title: Text('Job Filters'), content: JobFilterAlertBox());
      },
    );
  }

  @override
  State<JobFilterAlertBox> createState() => _JobFilterAlertBoxState();
}

final profileController = TextEditingController();

final locationController = TextEditingController();

class _JobFilterAlertBoxState extends State<JobFilterAlertBox> {
  @override
  Widget build(BuildContext context) {
    var jobFilterProvider = Provider.of<JobFilterProvider>(context);
    var salaryProvider = Provider.of<SignUpProviderModel>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFieldClass().buildProfileField(context, profileController),
          CheckboxListTile(
            title: const Text('Work from Home'),
            value: jobFilterProvider.workFromHome,
            onChanged: (newValue) {
              jobFilterProvider.setWorkFromHome(newValue!);
            },
          ),
          CheckboxListTile(
            title: const Text('Location'),
            value: jobFilterProvider.location,
            onChanged: (newValue) {
              jobFilterProvider.setLocation(newValue!);
            },
          ),
          jobFilterProvider.location
              ? TextFieldClass().buildLocationField(context, profileController)
              : Container(),
          CheckboxListTile(
            title: const Text('Hybrid'),
            value: jobFilterProvider.hybrid,
            onChanged: (newValue) {
              jobFilterProvider.setHybrid(newValue!);
            },
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Annual Salary (CTC)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Slider(
            value: salaryProvider.selectedSalary,
            min: 0.0,
            max: 1000000.0,
            divisions: 100,
            onChanged: (newValue) {
              salaryProvider.setSelectedSalary(newValue);
            },
          ),
          Text(
              'Selected Salary: ${salaryProvider.selectedSalary.toStringAsFixed(0)}'),
          ElevatedBtnWidget(
            onPressed: () {},
            title: 'Selected',
            btnColor: colorApp,
          )
        ],
      ),
    );
  }
}
