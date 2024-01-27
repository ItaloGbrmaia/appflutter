import 'package:app/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../cards/cards_quotes.dart';

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
