part of sl_utils;

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallSceenSize = 360;
const int customScreenSize = 1100;

enum ScreenSizeType { small, medium, large }

extension ContextExt on BuildContext {
  Size getScreenSize() {
    return MediaQuery.of(this).size;
  }

  ScreenSizeType getScreenSizeType() {
    final double width = getScreenSize().width;

    if (width >= largeScreenSize) {
      return ScreenSizeType.large;
    // ignore: invariant_booleans
    } else if (width < largeScreenSize && width >= mediumScreenSize) {
      return ScreenSizeType.medium;
    } else {
      return ScreenSizeType.small;
    }
  }
  // ···
}
