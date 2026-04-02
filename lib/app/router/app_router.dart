import 'package:doctor_speed_app/core/validators/compose_validators.dart';
import 'package:doctor_speed_app/core/validators/email_or_phone_validator.dart';
import 'package:doctor_speed_app/core/validators/password_validator.dart';
import 'package:doctor_speed_app/core/validators/required_validator.dart';
import 'package:doctor_speed_app/shared/widgets/app_gaps.dart';
import 'package:doctor_speed_app/shared/widgets/buttons/app_button.dart';
import 'package:doctor_speed_app/shared/widgets/buttons/app_icon_button.dart';
import 'package:doctor_speed_app/shared/widgets/buttons/app_outlined_button.dart';
import 'package:doctor_speed_app/shared/widgets/buttons/app_text_button.dart';
import 'package:doctor_speed_app/shared/widgets/inputs/app_password_field.dart';
import 'package:doctor_speed_app/shared/widgets/inputs/app_search_field.dart';
import 'package:doctor_speed_app/shared/widgets/inputs/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.root,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.root,
      builder: (context, state) {
        return const _PlaceholderPage();
      },
    ),
  ],
);

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor Speed')),
      body: Column(
        children: [
          AppGaps.h12,
          AppSearchField(hintText: 'Search doctors', onChanged: (value) {}),
          AppGaps.h12,
          AppPasswordField(
            labelText: 'Password',
            hintText: 'Enter your password',
            textInputAction: TextInputAction.done,
            validator: composeValidators([
              (value) =>
                  validateRequired(value, message: 'Password is required.'),
              (value) => validatePassword(value),
            ]),
          ),
          AppGaps.h12,
          AppTextField(
            // obscureText: true,
            onFieldSubmitted: (value) {},

            helperText: 'enter valid email',
            labelText: 'Email or phone',
            hintText: 'Enter your email or phone',
            textInputAction: TextInputAction.next,
            validator: composeValidators([
              (value) => validateRequired(
                value,
                message: 'Email or phone is required.',
              ),
              (value) => validateEmailOrPhone(value),
            ]),
          ),
          AppIconButton(
            icon: Icon(Icons.abc_sharp),
            onPressed: () {},
            tooltip: 'tooool',
          ),
          AppTextButton(label: 'forgot password?', onPressed: () {}),
          AppOutlinedButton(
            isExpanded: false,
            label: 'outlined',
            onPressed: () {},
            icon: Icon(Icons.abc_outlined),
          ),
          AppButton(
            isExpanded: false,
            label: 'continue',
            onPressed: () {},
            icon: Icon(Icons.abc_outlined),
          ),
          Center(
            child: Text(
              'Router is ready',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
