import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

import '../widgets/components/app_bar.dart';
import '../widgets/utils/colors.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  String? StrHtml;

  Future<String> loadHtml() async {
    StrHtml = await rootBundle.loadString('assets/html/index_vi.html');
    return StrHtml!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colos.BLUB, Colos.BACK_GROUND],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarV2(context, strTitle: 'Privacy & Policy'),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: FutureBuilder(
            future: loadHtml(),
            builder:
                (BuildContext context, AsyncSnapshot<String?> snapshotFirst) {
              if (snapshotFirst.hasData) {
                return Container(
                  child: loadHtmlCommonV2(StrHtml),
                );
              }
              return Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget loadHtmlCommonV2(String? strHtml) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Html(
        data: strHtml,
        tagsList: Html.tags..addAll(["bird", "flutter"]),
        style: {
          "body": Style(
              fontSize: FontSize(17.0),
              fontWeight: FontWeight.bold,
              color: Colors.blue),
          "table": Style(
            backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
          ),
          "tr": Style(
            border: Border(bottom: BorderSide(color: Colos.SEARCH)),
          ),
          "th": Style(
            padding: EdgeInsets.all(6),
            backgroundColor: Colos.SEARCH,
          ),
          "td": Style(
            padding: EdgeInsets.all(6),
            alignment: Alignment.topLeft,
          ),
          'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
        },
        onLinkTap: (url, _, __, ___) {
          print("Opening $url...");
        },
        onImageTap: (src, _, __, ___) {
          print(src);
        },
        onImageError: (exception, stackTrace) {
          print(exception);
        },
        onCssParseError: (css, messages) {
          print("css that errored: $css");
          print("error messages:");
          messages.forEach((element) {
            print(element);
          });
        },
      ),
    );
  }
}
