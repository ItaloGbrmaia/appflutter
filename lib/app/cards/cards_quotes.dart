import 'package:app/app/models/quote_models.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

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
          height: 389,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 144, 182, 212),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ), //
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.text),
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
                                color: Color(0xff80848F),
                                fontSize: 15.5,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 15,
                          child: ElevatedButton(
                            onPressed: () {
                              Share.share("");
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xff80848F),
                              backgroundColor: const Color(
                                0xffECECEC,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 9,
                                horizontal: 8,
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
