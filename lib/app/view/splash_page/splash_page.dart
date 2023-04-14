import 'package:flutter/material.dart';
import 'package:task_list/app/components/shape.dart';
import 'package:task_list/app/components/title_custom.dart';
import 'package:task_list/app/view/home_page/inherited_widgets.dart';
import 'package:task_list/app/view/task_list_page/task_list_page.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://docs.flutter.dev/tos');

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: const [Shape()],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 73, bottom: 99),
            child: Image.asset(
              'assets/images/onboarding-image.png',
              width: 180,
              height: 168,
            ),
          ),
          const TitleCustom(title: 'Lista de Tareas'),
          Text(
            'Inherited Widget',
            style: TextStyle(color: SpecialColor.of(context).color),
          ),
          const SizedBox(height: 21),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Ink(
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: Theme.of(context).colorScheme.primary),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TaskListPage()));
                    },
                    icon: const Icon(
                      Icons.arrow_circle_right,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
          GestureDetector(
            onTap: _launchUrl,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Terms of Service',
                    style: TextStyle(color: Colors.lightBlue),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
