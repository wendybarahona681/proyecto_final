import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 50),
              child: Image.asset(
                'assets/9.png', // Reemplaza con el nombre de tu imagen
                width: 100, // Ajusta el ancho según sea necesario
                height: 100, // Ajusta la altura según sea necesario

              ),
            ),
            Card(
              margin: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Theme.of(context).primaryColorLight,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                children: [
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 10, bottom: 25),
                    child: const Center(
                      child: Text(
                        'BIBLIE QUIZ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.indigo.shade200,
                              Colors.purple.shade300
                            ]),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/quiz-page');
                    },
                    child: const Text('Iniciar Quiz'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Theme.of(context).primaryColorLight,
                      elevation: 4,
                      side: const BorderSide(width: 1),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/review-page');
                    },
                    child: const Text('Repasar Quiz'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Theme.of(context).primaryColorLight,
                      elevation: 4,
                      side: const BorderSide(width: 1),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/nino-page');
                    },
                    child: const Text('Sección para niños'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Theme.of(context).primaryColorLight,
                      elevation: 4,
                      side: const BorderSide(width: 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
