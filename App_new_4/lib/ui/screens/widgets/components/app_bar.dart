import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/fontstyle.dart';

PreferredSize appBarV1(BuildContext context, {String? strTitle}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Container(
      color: Colos.BLUB.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  strTitle ?? '',
                  textAlign: TextAlign.center,
                  style: FontStyles.STYLE2.copyWith(fontSize: 24),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

PreferredSize appBarV2(BuildContext context, {String? strTitle}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Container(
      color: Colos.BLUB.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              Text(
                strTitle ?? '',
                textAlign: TextAlign.center,
                style: FontStyles.STYLE2.copyWith(fontSize: 24),
              ),
              SizedBox(width: 10)
            ],
          ),
        ],
      ),
    ),
  );
}

PreferredSize appBarV3(BuildContext context, {String? strTitle}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(66),
    child: Container(
      color: Colos.BLUB.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                strTitle ?? '',
                style: FontStyles.STYLE2.copyWith(fontSize: 24),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/requestblock');
                  },
                  icon: Transform.scale(
                      scale: 1.3,
                      child: Icon(Icons.add_box_outlined, color: Colors.white)))
            ],
          ),
        ],
      ),
    ),
  );
}
