import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:us_stock/domain/model/intraday_info.dart';

class StockChart extends StatelessWidget {
  final List<IntradayInfo> infos;

  const StockChart({
    this.infos = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: CustomPaint(
        painter: ChartPainter(
          infos.reversed.toList(),
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  final List<IntradayInfo> infos;
  final Color chartColor;
  final Color textColor;

  late int upperValue = infos.map((e) {
    return e.close;
  })
      .fold<double>(0.0, (prev, element) {
        return max(prev, element);
      }).ceil();
  late int lowerValue = infos.map((e) => e.close)
      .reduce((value, element) => min(value, element)).toInt();
  final spacing = 50.0;

  late Paint strokePaint = Paint()
    ..color = chartColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3
    ..strokeCap = StrokeCap.round;

  ChartPainter(
    this.infos,
    this.chartColor,
    this.textColor,
  ) {
    strokePaint = Paint()
      ..color = chartColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final priceStep = (upperValue - lowerValue) / 5.0;
    for(var i = 0; i < 5; i++) {
      final textSpan = TextSpan(
        text: '${(lowerValue + priceStep * i)}',
        style: TextStyle(
          fontSize: 12.0,
          color: textColor,
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(10, size.height - spacing -(i * size.height / 5.0)));
    }

    final spacePerHour = (size.width - spacing) / infos.length;
    for(var i = 0; i < infos.length; i += 12) {
      final hour = infos[i].date.hour;
      final textSpan = TextSpan(
        text: '$hour',
        style: TextStyle(
          fontSize: 12.0,
          color: textColor,
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(i * spacePerHour + spacing, size.height + 20));
    }

    var lastX = 0.0;
    final strokePath = Path();
    for(var i = 0; i < infos.length; i++) {
      final info = infos[i];
      var nextIndex = i + 1;
      if(i + 1 > infos.length -1) nextIndex = infos.length - 1;
      final nextInfo = infos[nextIndex];
      final leftRatio = (info.close - lowerValue) / (upperValue - lowerValue);
      final rightRatio = (nextInfo.close - lowerValue) / (upperValue - lowerValue);
      final x1 = spacing + i * spacePerHour;
      final y1 = size.height - (leftRatio * size.height);
      final x2 = spacing + (i + 1) * spacePerHour;
      final y2 = size.height - (rightRatio * size.height);
      if(i == 0) {
        strokePath.moveTo(x1, y1);
      }
      lastX = (x1 + x2) / 2.0;
      strokePath.quadraticBezierTo(x1, y1, lastX, (y1 + y2) / 2.0);
    }
    final fillPath = Path.from(strokePath)
      ..lineTo(lastX, size.height - spacing)
      ..lineTo(spacing, size.height - spacing)
      ..close();
    final fillPaint = Paint()
      ..color = chartColor
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(0, size.height - spacing),
        [
          chartColor.withOpacity(0.5),
          Colors.transparent,
        ],
      );
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(strokePath, strokePaint);
  }

  @override
  bool shouldRepaint(ChartPainter oldDelegate) {
    return oldDelegate.infos != infos;
  }
}
