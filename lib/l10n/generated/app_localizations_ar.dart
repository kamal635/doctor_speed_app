// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get commonConfirm => 'تأكيد';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonDiscardChanges => 'تجاهل التعديلات';

  @override
  String get failureNetwork =>
      'يرجى التحقق من اتصال الإنترنت ثم المحاولة مرة أخرى.';

  @override
  String get failureTimeout =>
      'استغرق الطلب وقتًا طويلًا. يرجى المحاولة مرة أخرى.';

  @override
  String get failureUnauthorized => 'تحتاج إلى تسجيل الدخول مجددًا للمتابعة.';

  @override
  String get failureForbidden => 'ليس لديك صلاحية لتنفيذ هذا الإجراء.';

  @override
  String get failureValidation =>
      'يرجى التحقق من البيانات المدخلة ثم المحاولة مرة أخرى.';

  @override
  String get failureNotFound => 'تعذر العثور على المورد المطلوب.';

  @override
  String get failureConflict =>
      'تعذر إكمال هذا الإجراء بسبب تعارض في البيانات.';

  @override
  String get failureRateLimited =>
      'عدد المحاولات كبير جدًا. يرجى المحاولة لاحقًا.';

  @override
  String get failureServer => 'حدث خطأ في الخادم. يرجى المحاولة لاحقًا.';

  @override
  String get failureUnknown => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';
}
