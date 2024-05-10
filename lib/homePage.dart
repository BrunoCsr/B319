import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mapPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterTts flutterTts = FlutterTts();

  final String main_text =
      'As notificações serão exibidas aqui. Clique na parte superior da tela para saber se o dispositivo está conectado. Pressione o centro ou a parte inferior para ouvir esta mensagem. Todas as notificações são lidas automaticamente.';

  final String text_bluetooth_case_true = 'Bluetooth conectado';
  final String text_bluetooth_case_false = 'Bluetooth desconectado';
  bool bluetooth_connected = true;
  bool hover = false;

  @override
  void initState() {
    super.initState();
    initializeTTS();
  }

  Future<void> initializeTTS() async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setSpeechRate(1.0);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'GUIDE',
            style: GoogleFonts.rowdies(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 192, 147),
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 192, 147),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 192, 147),
                        shadowColor: const Color.fromARGB(255, 255, 192, 147),
                        foregroundColor: Colors.black,
                        fixedSize: Size(80, 80)),
                    onPressed: () {
                      flutterTts.speak(bluetooth_connected
                          ? text_bluetooth_case_true
                          : text_bluetooth_case_false);
                    },
                    child: Center(
                      child: const Icon(
                        Icons.bluetooth_connected_sharp,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 217,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 192, 147),
                        shadowColor: const Color.fromARGB(255, 255, 192, 147),
                        foregroundColor: Colors.black,
                        fixedSize: Size(80, 80)),
                    onPressed: () {
                      flutterTts.speak(main_text);
                    },
                    child: const Icon(
                      Icons.volume_up_rounded,
                      size: 50,
                    ),
                  ),
                  ElevatedButton(onPressed: (){

                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapPage()),
                        );
                  }, child: Text('Mapa'))
                ],
              ),
            ),
            Center(
              child: Container(
                  height: 217,
                  width: double.infinity,
                 color: Color.fromARGB(255, 247, 211, 188),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(main_text,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lora(fontSize: 20)),
                    ),
                  )),
            ),
          ],
        ));
  }
}
