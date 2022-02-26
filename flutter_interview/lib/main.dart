import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/ulti/dimens.dart';
import 'package:flutter_interview/ulti/hex_color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String text ="Tôi đã từng du học 4 năm tại Hàn Quốc và đang có kinh nghiệm làm việc cho công ty tư vấn du học, tôi có thể giúp bạn giải đáp toàn bộ thắc mắc về vấn đề du học";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          width: 339.h,
          height: 320.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWidgetInfo(),
              SizedBox(height: 17.h),
              _buildLocation(),
              SizedBox(height: 17.h),
              Divider(height: 1.h, color: Colors.grey),
              SizedBox(height: 17.h),
              Text("Nội dung chào giá",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16.t, fontWeight: FontWeight.w600)),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text("Báo giá: 1.000.000đ",
                      style: GoogleFonts.nunitoSans(
                          fontSize: 15.t, fontWeight: FontWeight.w600)),
                  Spacer(),
                  Text("Thời lượng: 4 giờ",
                      style: GoogleFonts.nunitoSans(
                          fontSize: 15.t, fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(height: 8.h),
              ReadMoreText(
                text,
                textAlign: TextAlign.justify,
                trimLines: 2,
                colorClickableText: Colors.black,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Xem thêm',
                trimExpandedText: 'Ẩn bớt',
                style: GoogleFonts.nunitoSans(fontSize: 15.t, fontWeight: FontWeight.w400,color: HexColor("#3D3D4E")),
              )
            ],
          ),
        )));
  }

  _buildWidgetInfo() {
    return Row(
      children: [
        ClipOval(
            child: Container(
                height: 50.w,
                width: 50.w,
                child: Image.asset(
                  "assets/images/avatar.png",
                  fit: BoxFit.cover,
                ))),
        SizedBox(width: 10.w),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ngô Minh Đạt",
                style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w600,fontSize: 16.t)),
            SizedBox(
              height: 5.w,
            ),
            Row(
              children: [
                RatingBar.builder(
                  itemSize: 10.w,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.5.w),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(width: 5.w),
                Text(
                  "5.0",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14.t,
                  ),
                )
              ],
            )
          ],
        )),
        Container(
          width: 105.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: HexColor("#1C4843"),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Text(
              "Lựa chọn",
              style:
                  GoogleFonts.nunitoSans(fontSize: 14.t, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  _buildLocation() {
    return Row(
      children: [
        _buildWidgetTextWithIcon(
            assetPath: "assets/images/ic_location.png", text: "Hồ Chí Minh"),
        Spacer(),
        _buildWidgetTextWithIcon(
            assetPath: "assets/images/ic_dot.png",
            text: "Chuyên viên tư vấn du học")
      ],
    );
  }

  _buildWidgetTextWithIcon({required String assetPath, required String text}) {
    return Row(
      children: [
        Image.asset(
          assetPath,
          height: 10.h,
          width: 10.w,
        ),
        SizedBox(
          width: 7.w,
        ),
        Text(
          text,
          style: GoogleFonts.nunitoSans(
              fontSize: 15.t,
              color: HexColor("#6E6D7A"),
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
