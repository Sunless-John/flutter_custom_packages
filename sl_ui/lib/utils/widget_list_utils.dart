part of sl_ui;

extension WiidgetListExtension on List<Widget> {
  List<Widget> insertInBetween({required Widget widget, bool insertAround = false}) {
    final List<Widget> result = [];

    for (var i = 0; i < length; i++) {
      if (i == 0 && insertAround) {
        result.add(widget);
      }

      result.add(this[i]);

      if(i < length -1)
      {
        result.add(widget);
      }

      if (i == length - 1 && insertAround) {
        result.add(widget);
      }
    }

    return result;
  }
}
