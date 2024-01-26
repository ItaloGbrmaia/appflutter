import 'package:app/app/modules/controller/home_controller.dart';
import 'package:app/modules/home/models/Quote_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:share_plus/share_plus.dart';

class QuoteView extends StatefulWidget {
  QuoteView({
    super.key,
  });
  final controller = Modular.get<HomeController>();

  @override
  State<QuoteView> createState() => _QuoteViewState();
}

class _QuoteViewState extends State<QuoteView> {
  @override
  void initState() {
    super.initState();
    widget.controller.allQuote = [];
    widget.controller.homeQuote = [];
    widget.controller.homeQuoteList = [];
    widget.controller.pageQuote = 1;
    widget.controller.loadQuote();
  }

  Future<void> _onrefresh() async {
    widget.controller.loadQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return widget.controller.isLoading == false
            ? RefreshIndicator(
                onRefresh: _onrefresh,
                color: const Color(0xffE09090),
                child: widget.controller.internet != false &&
                        widget.controller.hatTime != false
                    ? SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: widget.controller.homeQuoteList!.map(
                            (e) {
                              return QuoteCardView(
                                e: e,
                              );
                            },
                          ).toList(),
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Ops!",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff80848F),
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 28.0, right: 28),
                              child: Text(
                                "Não foi possível conectar ao servidor, verifique se está conectado à internet.",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff80848F),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            ElevatedButton(
                              onPressed: _onrefresh,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                  0xffECECEC,
                                ), // Light gray background color
                              ),
                              child: const Text(
                                "Recarregar",
                                style: TextStyle(
                                  fontSize: 14.5,
                                  color: Color(
                                    0xff80848F,
                                  ), // Red text color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Color(0xffE09090),
                ),
              );
      },
    );
  }
}

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
