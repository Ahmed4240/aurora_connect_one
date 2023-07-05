import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../commons/app_colors.dart';



class CustomToast {
  CancelFunc? _cancel;
  void normalToast(String val, {bool short = false, int seconds = 3}) {
    _cancel = BotToast.showCustomNotification(
        toastBuilder: (_) {
          return _CustomWidget(val, true, cancelFunc: close);
        },
        duration: Duration(seconds: seconds),
        align: const Alignment(0, 0.85));
  }

  void generalToast(String val, {bool short = false, int milliSeconds = 1500}) {
    _cancel = BotToast.showCustomNotification(
        toastBuilder: (_) {
          return _CustomWidget(
            val,
            true,
            cancelFunc: close,
            showHeader: false,
          );
        },
        duration: const Duration(milliseconds: 1500),
        align: const Alignment(0, 0.85));
  }

  void close() {
    _cancel!();
  }

  void errorToast(String val, {bool short = false}) {
    _cancel = BotToast.showCustomNotification(
        toastBuilder: (_) {
          return _CustomWidget(val, false, cancelFunc: close);
        },
        duration: const Duration(seconds: 2),
        align: const Alignment(0, 0.85));
  }
}

class _CustomWidget extends StatefulWidget {
  final CancelFunc? cancelFunc;
  final bool isSuccess;
  final String message;
  final bool showHeader;

  const _CustomWidget(this.message, this.isSuccess,
      {Key? key, this.cancelFunc, this.showHeader = true})
      : super(key: key);

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<_CustomWidget> {
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: widget.isSuccess
          ? AppColors.activeColorPrimary
          : AppColors.activeColorPrimary,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.isSuccess
                        ? AppColors.activeColorPrimary
                        : AppColors.activeColorPrimary),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                    widget.isSuccess
                        ? ("assets/images/infoIconError.png")
                        : ("assets/images/infoIconError.png"),
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                )),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (widget.showHeader)
                      Text(
                        widget.isSuccess ? 'Success!' : 'Error!',
                        style: Theme.of(context).textTheme.subtitle2!
                            .copyWith(color: Colors.black),
                      ),
                    Flexible(
                      child: Text(widget.message,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.close,
                  color: widget.isSuccess
                      ? AppColors.activeColorPrimary
                      : AppColors.activeColorPrimary),
              onPressed: widget.cancelFunc,
            ),
          ],
        ),
      ),
    );
  }
}
