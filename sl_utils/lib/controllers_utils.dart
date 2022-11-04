part of sl_utils;

extension TabControllerExtension on TabController {
  void nextTab({Duration? duration, Curve curve = Curves.ease, bool loop = false}) {
    if (index + 1 < length) {
      animateTo(
        index + 1,
        duration: duration,
        curve: curve,
      );
      return;
    }
    if (loop && index + 1 == length) {
      animateTo(
        0,
        duration: duration,
        curve: curve,
      );
    }
  }

  void previousTab({Duration? duration, Curve curve = Curves.ease, bool loop = false}) {
    if (index - 1 >= 0) {
      animateTo(
        index - 1,
        duration: duration,
        curve: curve,
      );
      return;
    }
    if (loop && index - 1 < 0) {
      animateTo(
        length - 1,
        duration: duration,
        curve: curve,
      );
    }
  }
}
