import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiero_job_seeker/domain/core/colors/colors.dart';
import 'package:hiero_job_seeker/domain/core/constants/constants.dart';
import 'package:hiero_job_seeker/domain/core/widgets/widget.dart';
import 'package:hiero_job_seeker/domain/core/provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TextFieldClass {
  Widget buildEmailField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        label: 'E-mail',
        icon: Icons.email,
        suffixicon: model.isEmailValid == null
            ? null
            : model.isEmailValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isEmailValid == null
            ? null
            : model.isEmailValid == false
                ? Colors.red
                : Colors.green,
        hintText: 'Eg. example@gmail.com',
        onChanged: (value) => model.validateEmail(value!),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return 'Please Enter the E-mail';
          } else if (EmailValidator.validate(value)) {
            return null;
          } else {
            return 'E-mail is Not valid';
          }
        },
      ),
    );
  }

  Widget buildPasswordField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        label: 'Password',
        icon: Icons.fingerprint,
        suffixicon: model.isPasswordValid == null
            ? null
            : model.isPasswordValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isPasswordValid == null
            ? null
            : model.isPasswordValid == false
                ? Colors.redAccent
                : Colors.green,
        hintText: "Eg. Example@123",
        validator: (value) {
          if (RegExp(
                  r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
              .hasMatch(value!.trim())) {
            return null;
          } else if (value.isEmpty) {
            return 'Please Enter the password';
          } else {
            return 'Please Enter the Strong password';
          }
        },
        onChanged: (value) => model.validatePassword(value!),
      ),
    );
  }

  Widget buildFirstNameLastNameField(
    BuildContext context,
    TextEditingController firstNamecontroller,
    TextEditingController lastNamecontroller,
  ) {
    final size = MediaQuery.of(context).size;
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width / 2 - 16,
            child: TextFormWidget(
              controller: firstNamecontroller,
              label: 'First Name',
              icon: Icons.person,
              suffixicon: model.isFirstNameValid == null
                  ? null
                  : model.isFirstNameValid == false
                      ? Icons.cancel
                      : Icons.check_circle,
              suffixIconColor: model.isFirstNameValid == null
                  ? null
                  : model.isFirstNameValid == false
                      ? Colors.redAccent
                      : Colors.green,
              hintText: "Eg. Alex",
              onChanged: (value) => model.validateFirstName(value!),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter the Name';
                } else if (value.isNotEmpty &&
                    !value.contains(RegExp(r'[0-9]')) &&
                    !value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]')) &&
                    value.length > 3) {
                  return null;
                } else {
                  return 'Please Enter the valid name';
                }
              },
            ),
          ),
          SizedBox(
            width: size.width / 2 - 16,
            child: TextFormWidget(
                controller: lastNamecontroller,
                keyboardType: TextInputType.visiblePassword,
                label: 'Last Name',
                icon: Icons.person,
                hintText: "Eg. Mathew"),
          ),
        ],
      ),
    );
  }

  Widget buildPhoneField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        keyboardType: TextInputType.phone,
        label: 'Phone Number',
        icon: Icons.phone,
        suffixicon: model.isPhoneNumberValid == null
            ? null
            : model.isPhoneNumberValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isPhoneNumberValid == null
            ? null
            : model.isPhoneNumberValid == false
                ? Colors.redAccent
                : Colors.green,
        hintText: "Eg. 9123986562",
        onChanged: (value) => model.validatePhoneNumber(value!),
        validator: (value) {
          RegExp phoneNumberRegex = RegExp(r'^[0-9]{10}$');

          if (phoneNumberRegex.hasMatch(value!.trim())) {
            return null;
          } else if (value.isEmpty) {
            return 'Please Enter the Phone No';
          } else {
            return 'Invalid Number';
          }
        },
      ),
    );
  }

  Widget buildAddressField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormWidget(
        maxLines: 8,
        label: 'Address',
        controller: controller,
        icon: Icons.mark_as_unread_sharp,
        suffixicon: model.isAddressValid == null
            ? null
            : model.isAddressValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isAddressValid == null
            ? null
            : model.isAddressValid == false
                ? Colors.redAccent
                : Colors.green,
        onChanged: (value) => model.validateAddress(value!),
        validator: (value) {
          if (value!.trim().length > 6 &&
              !value.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
            return null;
          } else if (value.isEmpty) {
            return 'Please enter the address';
          } else {
            return 'Enter valid Address';
          }
        },
      ),
    );
  }

  Widget buildDOBField(
      BuildContext context, TextEditingController dateEditingConntroller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox15H,
          const Text(
            'DOB',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          sizedBox10H,
          TextFormField(
              initialValue: null,
              readOnly: true,
              controller: dateEditingConntroller,
              decoration: InputDecoration(
                filled: true,
                suffixIcon: model.isDOBvalid == null
                    ? null
                    : model.isDOBvalid == false
                        ? const Icon(
                            Icons.cancel,
                            color: colorRed,
                          )
                        : const Icon(
                            Icons.check_circle,
                            color: colorGreen,
                          ),
                fillColor: colorWhite,
                prefixIcon: const Icon(Icons.calendar_month),
                labelText: 'DOB',
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorApp,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                if (date != null) {
                  dateEditingConntroller.text =
                      DateFormat('dd MMM yyyy').format(date);
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Select DOB";
                } else {
                  return null;
                }
              },
              onChanged: (value) =>
                  model.validateDOB(dateEditingConntroller.text)),
        ],
      ),
    );
  }

  Widget buildGenderField(
      BuildContext context, TextEditingController controller) {
    return Consumer<GenderProvider>(
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox15H,
          const Text(
            'Gender',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          sizedBox10H,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Radio(
                value: Gender.Male,
                groupValue: model.selectedGender,
                onChanged: (value) {
                  model.setSelectedGender(value!, controller);
                },
              ),
              const Text('Male'),
              Radio(
                value: Gender.Female,
                groupValue: model.selectedGender,
                onChanged: (value) {
                  model.setSelectedGender(value!, controller);
                },
              ),
              const Text('Female'),
              Radio(
                value: Gender.Other,
                groupValue: model.selectedGender,
                onChanged: (value) {
                  model.setSelectedGender(value!, controller);
                },
              ),
              const Text('Other'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBIOField(BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        maxLines: 8,
        label: 'Bio',
        icon: Icons.airplay,
        suffixicon: model.isBioValid == null
            ? null
            : model.isBioValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isBioValid == null
            ? null
            : model.isBioValid == false
                ? Colors.redAccent
                : Colors.green,
        onChanged: (value) => model.validateBio(value!),
        validator: (value) {
          if (value!.trim().length > 6 &&
              !value.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
            return null;
          } else {
            return 'Please Enter the valid Bio';
          }
        },
      ),
    );
  }

  Widget buildProfileField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        label: 'Profile',
        hintText: 'Eg. Marketing',
        icon: FontAwesomeIcons.chair,
        suffixicon: model.isBioValid == null
            ? null
            : model.isBioValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isBioValid == null
            ? null
            : model.isBioValid == false
                ? Colors.redAccent
                : Colors.green,
        onChanged: (value) => model.validateBio(value!),
        validator: (value) {
          if (value!.trim().length > 6 &&
              !value.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
            return null;
          } else {
            return 'Please Enter the valid Profile';
          }
        },
      ),
    );
  }

  Widget buildLocationField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        label: 'Location',
        hintText: 'Eg. Delhi',
        icon: FontAwesomeIcons.locationArrow,
        suffixicon: model.isBioValid == null
            ? null
            : model.isBioValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isBioValid == null
            ? null
            : model.isBioValid == false
                ? Colors.redAccent
                : Colors.green,
        onChanged: (value) => model.validateBio(value!),
        validator: (value) {
          if (value!.trim().length > 6 &&
              !value.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
            return null;
          } else {
            return 'Please Enter the valid Profile';
          }
        },
      ),
    );
  }
}
