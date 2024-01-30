import 'package:app/app/models/quote_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

const String assetName = 'assets/svg/montain.svg';
final Widget svg = SvgPicture.asset(
  assetName,
  height: 409,
  semanticsLabel: 'Acme Logo',
  color: const Color.fromARGB(255, 111, 159, 196),
);

class QuoteCardView extends StatelessWidget {
  const QuoteCardView({
    super.key,
    required this.e,
  });
  final QuoteModel e;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 489,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                        height: 409,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 149, 205, 248),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: svg //
                        ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              e.text,
                              style: const TextStyle(
                                color: Color(0xff446DAF),
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                overflow: TextOverflow.clip,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 15,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 4,
                            ),
                            child: Text(
                              e.author,
                              style: const TextStyle(
                                color: Color(0xff446DAF),
                                fontSize: 15.5,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 15,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: SizedBox(
                              child: ElevatedButton(
                                onPressed: () {
                                  Share.share("");
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  backgroundColor: const Color(
                                    0xff446DAF,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(
                                      Icons.share,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Compartilhar",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12),
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xff80848F).withOpacity(0.3),
          ),
        ),
        const SizedBox(
          height: 19,
        ),
      ],
    );
  }
}
