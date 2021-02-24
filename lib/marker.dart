import 'package:flutter/rendering.dart';

class UsaMarker extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7729167, size.height * 0.2383333);
    path_0.cubicTo(
        size.width * 0.7135417,
        size.height * 0.1641667,
        size.width * 0.6093750,
        size.height * 0.1175000,
        size.width * 0.5000000,
        size.height * 0.1150000);
    path_0.cubicTo(
        size.width * 0.3927083,
        size.height * 0.1175000,
        size.width * 0.2885417,
        size.height * 0.1641667,
        size.width * 0.2291667,
        size.height * 0.2375000);
    path_0.cubicTo(
        size.width * 0.1760417,
        size.height * 0.3041667,
        size.width * 0.1666667,
        size.height * 0.3825000,
        size.width * 0.2031250,
        size.height * 0.4533333);
    path_0.cubicTo(
        size.width * 0.2697917,
        size.height * 0.5800000,
        size.width * 0.3937500,
        size.height * 0.6900000,
        size.width * 0.4937500,
        size.height * 0.7716667);
    path_0.cubicTo(
        size.width * 0.4958333,
        size.height * 0.7733333,
        size.width * 0.4979167,
        size.height * 0.7741667,
        size.width * 0.5010417,
        size.height * 0.7741667);
    path_0.cubicTo(
        size.width * 0.5041667,
        size.height * 0.7741667,
        size.width * 0.5062500,
        size.height * 0.7733333,
        size.width * 0.5072917,
        size.height * 0.7716667);
    path_0.cubicTo(
        size.width * 0.6041667,
        size.height * 0.6916667,
        size.width * 0.7239583,
        size.height * 0.5841667,
        size.width * 0.7937500,
        size.height * 0.4608333);
    path_0.cubicTo(
        size.width * 0.8343750,
        size.height * 0.3883333,
        size.width * 0.8270833,
        size.height * 0.3075000,
        size.width * 0.7729167,
        size.height * 0.2383333);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffFFFFFF).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4197917, size.height * 0.3116667);
    path_1.lineTo(size.width * 0.4375000, size.height * 0.3116667);
    path_1.lineTo(size.width * 0.4375000, size.height * 0.3733333);
    path_1.cubicTo(
        size.width * 0.4375000,
        size.height * 0.3841667,
        size.width * 0.4364583,
        size.height * 0.3925000,
        size.width * 0.4333333,
        size.height * 0.3991667);
    path_1.cubicTo(
        size.width * 0.4302083,
        size.height * 0.4058333,
        size.width * 0.4250000,
        size.height * 0.4108333,
        size.width * 0.4166667,
        size.height * 0.4150000);
    path_1.cubicTo(
        size.width * 0.4083333,
        size.height * 0.4191667,
        size.width * 0.3979167,
        size.height * 0.4208333,
        size.width * 0.3854167,
        size.height * 0.4208333);
    path_1.cubicTo(
        size.width * 0.3729167,
        size.height * 0.4208333,
        size.width * 0.3625000,
        size.height * 0.4191667,
        size.width * 0.3541667,
        size.height * 0.4158333);
    path_1.cubicTo(
        size.width * 0.3458333,
        size.height * 0.4125000,
        size.width * 0.3406250,
        size.height * 0.4075000,
        size.width * 0.3375000,
        size.height * 0.4008333);
    path_1.cubicTo(
        size.width * 0.3343750,
        size.height * 0.3941667,
        size.width * 0.3322917,
        size.height * 0.3850000,
        size.width * 0.3322917,
        size.height * 0.3741667);
    path_1.lineTo(size.width * 0.3322917, size.height * 0.3125000);
    path_1.lineTo(size.width * 0.3500000, size.height * 0.3125000);
    path_1.lineTo(size.width * 0.3500000, size.height * 0.3741667);
    path_1.cubicTo(
        size.width * 0.3500000,
        size.height * 0.3833333,
        size.width * 0.3510417,
        size.height * 0.3900000,
        size.width * 0.3531250,
        size.height * 0.3950000);
    path_1.cubicTo(
        size.width * 0.3552083,
        size.height * 0.4000000,
        size.width * 0.3593750,
        size.height * 0.4025000,
        size.width * 0.3645833,
        size.height * 0.4050000);
    path_1.cubicTo(
        size.width * 0.3697917,
        size.height * 0.4075000,
        size.width * 0.3760417,
        size.height * 0.4083333,
        size.width * 0.3843750,
        size.height * 0.4083333);
    path_1.cubicTo(
        size.width * 0.3979167,
        size.height * 0.4083333,
        size.width * 0.4062500,
        size.height * 0.4058333,
        size.width * 0.4125000,
        size.height * 0.4008333);
    path_1.cubicTo(
        size.width * 0.4187500,
        size.height * 0.3958333,
        size.width * 0.4208333,
        size.height * 0.3866667,
        size.width * 0.4208333,
        size.height * 0.3733333);
    path_1.lineTo(size.width * 0.4208333, size.height * 0.3116667);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.4614583, size.height * 0.3841667);
    path_2.lineTo(size.width * 0.4781250, size.height * 0.3833333);
    path_2.cubicTo(
        size.width * 0.4791667,
        size.height * 0.3883333,
        size.width * 0.4812500,
        size.height * 0.3933333,
        size.width * 0.4833333,
        size.height * 0.3966667);
    path_2.cubicTo(
        size.width * 0.4864583,
        size.height * 0.4000000,
        size.width * 0.4906250,
        size.height * 0.4025000,
        size.width * 0.4968750,
        size.height * 0.4050000);
    path_2.cubicTo(
        size.width * 0.5031250,
        size.height * 0.4075000,
        size.width * 0.5093750,
        size.height * 0.4083333,
        size.width * 0.5177083,
        size.height * 0.4083333);
    path_2.cubicTo(
        size.width * 0.5250000,
        size.height * 0.4083333,
        size.width * 0.5302083,
        size.height * 0.4075000,
        size.width * 0.5354167,
        size.height * 0.4058333);
    path_2.cubicTo(
        size.width * 0.5406250,
        size.height * 0.4041667,
        size.width * 0.5447917,
        size.height * 0.4016667,
        size.width * 0.5468750,
        size.height * 0.3991667);
    path_2.cubicTo(
        size.width * 0.5489583,
        size.height * 0.3966667,
        size.width * 0.5510417,
        size.height * 0.3933333,
        size.width * 0.5510417,
        size.height * 0.3900000);
    path_2.cubicTo(
        size.width * 0.5510417,
        size.height * 0.3866667,
        size.width * 0.5500000,
        size.height * 0.3833333,
        size.width * 0.5468750,
        size.height * 0.3808333);
    path_2.cubicTo(
        size.width * 0.5437500,
        size.height * 0.3783333,
        size.width * 0.5406250,
        size.height * 0.3758333,
        size.width * 0.5343750,
        size.height * 0.3741667);
    path_2.cubicTo(
        size.width * 0.5312500,
        size.height * 0.3733333,
        size.width * 0.5229167,
        size.height * 0.3716667,
        size.width * 0.5104167,
        size.height * 0.3691667);
    path_2.cubicTo(
        size.width * 0.4979167,
        size.height * 0.3666667,
        size.width * 0.4895833,
        size.height * 0.3641667,
        size.width * 0.4843750,
        size.height * 0.3625000);
    path_2.cubicTo(
        size.width * 0.4781250,
        size.height * 0.3600000,
        size.width * 0.4729167,
        size.height * 0.3566667,
        size.width * 0.4697917,
        size.height * 0.3525000);
    path_2.cubicTo(
        size.width * 0.4666667,
        size.height * 0.3483333,
        size.width * 0.4645833,
        size.height * 0.3441667,
        size.width * 0.4645833,
        size.height * 0.3391667);
    path_2.cubicTo(
        size.width * 0.4645833,
        size.height * 0.3333333,
        size.width * 0.4666667,
        size.height * 0.3283333,
        size.width * 0.4708333,
        size.height * 0.3241667);
    path_2.cubicTo(
        size.width * 0.4750000,
        size.height * 0.3200000,
        size.width * 0.4802083,
        size.height * 0.3158333,
        size.width * 0.4875000,
        size.height * 0.3133333);
    path_2.cubicTo(
        size.width * 0.4947917,
        size.height * 0.3108333,
        size.width * 0.5031250,
        size.height * 0.3100000,
        size.width * 0.5125000,
        size.height * 0.3100000);
    path_2.cubicTo(
        size.width * 0.5229167,
        size.height * 0.3100000,
        size.width * 0.5312500,
        size.height * 0.3116667,
        size.width * 0.5385417,
        size.height * 0.3141667);
    path_2.cubicTo(
        size.width * 0.5458333,
        size.height * 0.3166667,
        size.width * 0.5520833,
        size.height * 0.3208333,
        size.width * 0.5562500,
        size.height * 0.3258333);
    path_2.cubicTo(
        size.width * 0.5604167,
        size.height * 0.3308333,
        size.width * 0.5625000,
        size.height * 0.3366667,
        size.width * 0.5625000,
        size.height * 0.3425000);
    path_2.lineTo(size.width * 0.5458333, size.height * 0.3433333);
    path_2.cubicTo(
        size.width * 0.5447917,
        size.height * 0.3366667,
        size.width * 0.5416667,
        size.height * 0.3316667,
        size.width * 0.5364583,
        size.height * 0.3283333);
    path_2.cubicTo(
        size.width * 0.5312500,
        size.height * 0.3250000,
        size.width * 0.5229167,
        size.height * 0.3233333,
        size.width * 0.5135417,
        size.height * 0.3233333);
    path_2.cubicTo(
        size.width * 0.5031250,
        size.height * 0.3233333,
        size.width * 0.4947917,
        size.height * 0.3250000,
        size.width * 0.4895833,
        size.height * 0.3283333);
    path_2.cubicTo(
        size.width * 0.4843750,
        size.height * 0.3316667,
        size.width * 0.4822917,
        size.height * 0.3350000,
        size.width * 0.4822917,
        size.height * 0.3400000);
    path_2.cubicTo(
        size.width * 0.4822917,
        size.height * 0.3441667,
        size.width * 0.4843750,
        size.height * 0.3466667,
        size.width * 0.4875000,
        size.height * 0.3491667);
    path_2.cubicTo(
        size.width * 0.4906250,
        size.height * 0.3516667,
        size.width * 0.5000000,
        size.height * 0.3541667,
        size.width * 0.5145833,
        size.height * 0.3566667);
    path_2.cubicTo(
        size.width * 0.5291667,
        size.height * 0.3591667,
        size.width * 0.5385417,
        size.height * 0.3616667,
        size.width * 0.5447917,
        size.height * 0.3633333);
    path_2.cubicTo(
        size.width * 0.5531250,
        size.height * 0.3658333,
        size.width * 0.5583333,
        size.height * 0.3700000,
        size.width * 0.5625000,
        size.height * 0.3741667);
    path_2.cubicTo(
        size.width * 0.5666667,
        size.height * 0.3783333,
        size.width * 0.5677083,
        size.height * 0.3833333,
        size.width * 0.5677083,
        size.height * 0.3891667);
    path_2.cubicTo(
        size.width * 0.5677083,
        size.height * 0.3950000,
        size.width * 0.5656250,
        size.height * 0.4000000,
        size.width * 0.5614583,
        size.height * 0.4050000);
    path_2.cubicTo(
        size.width * 0.5572917,
        size.height * 0.4100000,
        size.width * 0.5510417,
        size.height * 0.4141667,
        size.width * 0.5437500,
        size.height * 0.4166667);
    path_2.cubicTo(
        size.width * 0.5364583,
        size.height * 0.4191667,
        size.width * 0.5270833,
        size.height * 0.4208333,
        size.width * 0.5177083,
        size.height * 0.4208333);
    path_2.cubicTo(
        size.width * 0.5052083,
        size.height * 0.4208333,
        size.width * 0.4958333,
        size.height * 0.4191667,
        size.width * 0.4875000,
        size.height * 0.4166667);
    path_2.cubicTo(
        size.width * 0.4791667,
        size.height * 0.4141667,
        size.width * 0.4729167,
        size.height * 0.4091667,
        size.width * 0.4677083,
        size.height * 0.4041667);
    path_2.cubicTo(
        size.width * 0.4645833,
        size.height * 0.3975000,
        size.width * 0.4614583,
        size.height * 0.3916667,
        size.width * 0.4614583,
        size.height * 0.3841667);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.5781250, size.height * 0.4183333);
    path_3.lineTo(size.width * 0.6291667, size.height * 0.3108333);
    path_3.lineTo(size.width * 0.6479167, size.height * 0.3108333);
    path_3.lineTo(size.width * 0.7031250, size.height * 0.4183333);
    path_3.lineTo(size.width * 0.6833333, size.height * 0.4183333);
    path_3.lineTo(size.width * 0.6677083, size.height * 0.3858333);
    path_3.lineTo(size.width * 0.6114583, size.height * 0.3858333);
    path_3.lineTo(size.width * 0.5968750, size.height * 0.4183333);
    path_3.lineTo(size.width * 0.5781250, size.height * 0.4183333);
    path_3.close();
    path_3.moveTo(size.width * 0.6166667, size.height * 0.3741667);
    path_3.lineTo(size.width * 0.6625000, size.height * 0.3741667);
    path_3.lineTo(size.width * 0.6489583, size.height * 0.3441667);
    path_3.cubicTo(
        size.width * 0.6447917,
        size.height * 0.3350000,
        size.width * 0.6416667,
        size.height * 0.3275000,
        size.width * 0.6395833,
        size.height * 0.3216667);
    path_3.cubicTo(
        size.width * 0.6375000,
        size.height * 0.3283333,
        size.width * 0.6354167,
        size.height * 0.3350000,
        size.width * 0.6322917,
        size.height * 0.3425000);
    path_3.lineTo(size.width * 0.6166667, size.height * 0.3741667);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Color(0xff5642E5).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.8516667),
        size.width * 0.07604167, paint_4_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ArrowMarker extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.9803571,size.height*0.4680804);
    path_0.lineTo(size.width*0.05178571,size.height*0.003794643);
    path_0.cubicTo(size.width*0.03750000,size.height*-0.003348214,size.width*0.02031250,size.height*-0.0002232143,size.width*0.009375000,size.height*0.01160714);
    path_0.cubicTo(size.width*-0.001339286,size.height*0.02343750,size.width*-0.003125000,size.height*0.04084821,size.width*0.005357143,size.height*0.05446429);
    path_0.lineTo(size.width*0.2408482,size.height*0.4372768);
    path_0.cubicTo(size.width*0.2645089,size.height*0.4756696,size.width*0.2645089,size.height*0.5243304,size.width*0.2408482,size.height*0.5627232);
    path_0.lineTo(size.width*0.005357143,size.height*0.9455357);
    path_0.cubicTo(size.width*-0.002901786,size.height*0.9591518,size.width*-0.001339286,size.height*0.9765625,size.width*0.009375000,size.height*0.9883929);
    path_0.cubicTo(size.width*0.01629464,size.height*0.9959821,size.width*0.02589286,size.height,size.width*0.03571429,size.height);
    path_0.cubicTo(size.width*0.04107143,size.height,size.width*0.04665179,size.height*0.9988839,size.width*0.05178571,size.height*0.9962054);
    path_0.lineTo(size.width*0.9803571,size.height*0.5319196);
    path_0.cubicTo(size.width*0.9924107,size.height*0.5258929,size.width,size.height*0.5133929,size.width,size.height*0.5000000);
    path_0.cubicTo(size.width,size.height*0.4863839,size.width*0.9924107,size.height*0.4741071,size.width*0.9803571,size.height*0.4680804);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff422BCC).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}