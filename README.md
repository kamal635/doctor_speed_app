# Doctor Speed Mobile App

Flutter mobile application for Doctor Speed.

## Status
Project setup in progress.

## Stack
- Flutter
- Riverpod
- GoRouter
- Dio

## Architecture

The project is built using a clean, scalable structure based on four top-level areas:

```text
lib/
├── app/                        # App-level orchestration only
│   ├── bootstrap/              # App startup and initialization
│   ├── router/                 # Route tree and navigation setup
│   ├── guards/                 # Route guards such as auth/onboarding checks
│   ├── shell/                  # Root shells and app-wide navigation containers
│   └── theme/                  # ThemeData configuration for the whole app
│
├── core/                       # Low-level technical foundations
│   ├── constants/              # Global technical constants
│   ├── errors/                 # Failures, exceptions, and error mapping
│   ├── result/                 # Result types such as Ok/Err
│   ├── network/                # Dio base client, interceptors, network config
│   ├── storage/                # Secure storage and local storage abstractions
│   ├── utils/                  # General utility helpers
│   ├── extensions/             # Shared extensions
│   └── validators/             # Reusable validators
│
├── shared/                     # Reusable UI only
│   ├── design_system/          # AppColors, AppSpacing, AppRadius, AppTypography
│   ├── widgets/                # Shared widgets used across multiple features
│   └── layouts/                # Shared layouts and reusable page structures
│
└── features/                   # All business capabilities live here
    ├── app_startup/            # Initial startup decision flow
    ├── onboarding/             # Intro screens
    ├── role_selection/         # Patient/Doctor entry selection
    ├── auth/                   # Login, register, forgot/reset password, logout
    ├── account_verification/   # Send/resend/verify code flows
    ├── account_security/       # Change password, email, phone
    ├── doctor_application/     # Doctor application, review, rejection, resubmission
    └── doctor_subscription/    # Plans, renew, upgrade, history