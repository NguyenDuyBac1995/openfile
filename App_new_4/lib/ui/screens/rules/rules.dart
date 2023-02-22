import 'package:app_new_2/ui/screens/widgets/utils/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/utils/colors.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  clearSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('${prefs.getInt('key')}');
    prefs.remove('key');
    print('${prefs.getInt('key')}');
  }
  bool value1 = false;
  String strHtml = '';

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.yellow;
    }
    return Colors.yellow;
  }


  Future<String> loadHtml() async {
    String strHtml = await rootBundle.loadString('assets/html/index_vi.html');
    Logger().i(strHtml);
    return strHtml;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadHtml(),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshotFirst) {
          if (snapshotFirst.hasData) {
            return Scaffold(
              body : Container(
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colos.BLUB, Colos.BACK_GROUND],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: (){
                        clearSharedPrefs();}, child: Text('Clear')),
                      SizedBox(height: 20),
                      const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Privacy & Policy',
                            style: FontStyles.STYLE1,
                          )),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              height: 470,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Html(
                                  data: snapshotFirst.data,
                                  tagsList: Html.tags
                                    ..addAll(["bird", "flutter"]),
                                  style: {
                                    "table": Style(
                                      backgroundColor:
                                          Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                                    ),
                                    "tr": Style(
                                      border: Border(
                                          bottom: BorderSide(color: Colors.grey)),
                                    ),
                                    "th": Style(
                                      padding: EdgeInsets.all(6),
                                      backgroundColor: Colors.grey,
                                    ),
                                    "td": Style(
                                      padding: EdgeInsets.all(6),
                                      alignment: Alignment.topLeft,
                                    ),
                                    'h5': Style(
                                        maxLines: 2,
                                        textOverflow: TextOverflow.ellipsis),
                                  },
                                  customRender: {
                                    "table": (context, child) {
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child:
                                            (context.tree as TableLayoutElement)
                                                .toWidget(context),
                                      );
                                    },
                                    "bird":
                                        (RenderContext context, Widget child) {
                                      return TextSpan(text: "🐦");
                                    },
                                    "flutter":
                                        (RenderContext context, Widget child) {
                                      return FlutterLogo(
                                        style: (context.tree.element!
                                                    .attributes['horizontal'] !=
                                                null)
                                            ? FlutterLogoStyle.horizontal
                                            : FlutterLogoStyle.markOnly,
                                        textColor: context.style.color!,
                                        size: context.style.fontSize!.size! * 5,
                                      );
                                    },
                                  },
                                  customImageRenders: {
                                    networkSourceMatcher(
                                            domains: ["flutter.dev"]):
                                        (context, attributes, element) {
                                      return FlutterLogo(size: 36);
                                    },
                                    networkSourceMatcher(
                                            domains: ["mydomain.com"]):
                                        networkImageRender(
                                      headers: {"Custom-Header": "some-value"},
                                      altWidget: (alt) => Text(alt ?? ""),
                                      loadingWidget: () => Text("Loading..."),
                                    ),
                                    // On relative paths starting with /wiki, prefix with a base url
                                    (attr, _) =>
                                            attr["src"] != null &&
                                            attr["src"]!.startsWith("/wiki"):
                                        networkImageRender(
                                            mapUrl: (url) =>
                                                "https://upload.wikimedia.org" +
                                                url!),
                                    // Custom placeholder image for broken links
                                    networkSourceMatcher(): networkImageRender(
                                        altWidget: (_) => FlutterLogo()),
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
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale: 1.4,
                                    child: Checkbox(
                                        fillColor: MaterialStateProperty.resolveWith(getColor),
                                        checkColor: Colors.white ,
                                        value: value1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            value1 = value!;
                                          });
                                        }),
                                  ),
                                  Text('  Agree to deal', style: FontStyles.STYLE2.copyWith(fontSize: 19))
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                child: Container(
                                  height: 50,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    color: value1 ? 
                                        Colos.BLUB_BUTTON:
                                        Colos.BUTTON_UNSELECT,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Continue' , style: FontStyles.STYLE2.copyWith(fontSize: 18),
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  if(value1 == true){
                                    Navigator.pushNamed(context, '/home');
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
              ),
            );
          }
          return Container(
              padding: const EdgeInsets.all(20.0),
              child: const Center(child: CircularProgressIndicator()));
        });

  }
}
