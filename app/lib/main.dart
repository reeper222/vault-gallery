import 'package:flutter/material.dart';

void main() {
  runApp(const VaultGalleryApp());
}

class VaultGalleryApp extends StatelessWidget {
  const VaultGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vault Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';

  void press(String value) {
    setState(() {
      input += value;

      if (input.endsWith('2580=')) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const PasswordScreen(),
          ),
        );

        input = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttons = [
      '7','8','9','/',
      '4','5','6','*',
      '1','2','3','-',
      '0','=','C','+',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                input,
                style: const TextStyle(fontSize: 36),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                final text = buttons[index];

                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: ElevatedButton(
                    onPressed: () {
                      if (text == 'C') {
                        setState(() {
                          input = '';
                        });
                      } else {
                        press(text);
                      }
                    },
                    child: Text(
                      text,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final controller = TextEditingController();
  String error = '';

  void login() {
    if (controller.text == '8052') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const GalleryScreen(),
        ),
      );
    } else {
      setState(() {
        error = 'Wrong password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vault Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: controller,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: login,
              child: const Text('Open Vault'),
            ),
            const SizedBox(height: 12),
            Text(error),
          ],
        ),
      ),
    );
  }
}

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vault Gallery'),
      ),
      body: const Center(
        child: Text(
          'Gallery coming soon',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
