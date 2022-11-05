part of sl_ui;

typedef StringFunction = Future<String> Function();
typedef LoadingButtonChildBuilder = Widget Function(BuildContext, LoadingButtonStatus);
typedef LoadingButtonDecorationCallBack = Decoration Function(LoadingButtonStatus);

class LoadingButton extends StatefulWidget {
  LoadingButton({Key? key, this.onPressed, LoadingButtonDecorationCallBack? decorationBuilder})
      : super(key: key) {
    if (decorationBuilder != null) {
      this.decorationBuilder = decorationBuilder;
    } else {
      this.decorationBuilder = (status) {
        switch (status) {
          case LoadingButtonStatus.loading:
            return BoxDecoration(
              color: Colors.orange.shade300,
              shape: BoxShape.circle,
            );
          case LoadingButtonStatus.error:
            return const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            );
          case LoadingButtonStatus.success:
            return const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            );
          case LoadingButtonStatus.init:
            return BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green)
            );
        }
      };
    }
  }

  factory LoadingButton.builder({
    Key? key,
    StringFunction? onPressed,
    required LoadingButtonChildBuilder builder,
    LoadingButtonDecorationCallBack? decorationBuilder,
  }) {
    final button = LoadingButton(
      key: key,
      onPressed: onPressed,
      decorationBuilder: decorationBuilder,
    );
    button.builder = builder;
    return button;
  }

  final StringFunction? onPressed;
  late final LoadingButtonChildBuilder builder;
  late final LoadingButtonDecorationCallBack decorationBuilder;

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  LoadingButtonStatus status = LoadingButtonStatus.init;
  bool get isLoading => status == LoadingButtonStatus.loading;
  bool get hasSucceed => status == LoadingButtonStatus.success;
  bool get hasFailed => status == LoadingButtonStatus.error;
  String errorMsg = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.decorationBuilder.call(status),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: const Text('My Loading Button'),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      ),
    );
  }

  Future<void> performPress() async {
    if (widget.onPressed == null) {
      return;
    }
    errorMsg = '';

    setState(() {
      status = LoadingButtonStatus.loading;
    });

    errorMsg = await widget.onPressed!();

    setState(() {
      status = errorMsg.isEmpty ? LoadingButtonStatus.success : LoadingButtonStatus.error;
    });
  }
}

enum LoadingButtonStatus {
  init,
  loading,
  error,
  success,
}
