import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Лабораторная - Полная версия',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Flutter Lab - Все элементы'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pressCount = 0;
  
  // Обработчик для FloatingActionButton
  void _onFabPressed() {
    print('FloatingActionButton pressed!');
    print('Кнопка была нажата $_pressCount раз');
    print('Текущее время: ${DateTime.now().toString()}');
    
    setState(() {
      _pressCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Первый Container
            Container(
              width: 320,
              height: 120,
              color: Colors.indigo[400],
              margin: const EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  'Container 1 (базовый)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            // Row с тремя Text
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.indigo[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.indigo[100], width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Элемент 1',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Элемент 2',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Элемент 3',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            
            // Expanded с Row и CircleAvatar
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                'Продвинутая часть: Expanded, Row и CircleAvatar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            // Expanded виджет
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Row с двумя CircleAvatar внутри Expanded',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Row с двумя CircleAvatar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Первый CircleAvatar с фиксированным radius
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 45,  // разный radius
                              backgroundColor: Colors.blue[100],
                              child: const Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Radius: 45',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        
                        // Второй CircleAvatar с изображением из сети
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 60,  // другой radius
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1541963463532-d68292c34b19?w=400&h=400&fit=crop'
                              ),
                              // Fallback child если изображение не загрузится
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.image,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Radius: 60\n(Network Image)',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        
                        // Третий CircleAvatar для демонстрации
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 35,  // третий radius
                              backgroundColor: Colors.purple[100],
                              child: const Text(
                                'AB',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Radius: 35',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Информация о нажатиях FAB
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.indigo[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.info,
                            color: Colors.indigo,
                            size: 24,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'FAB нажат: $_pressCount раз',
                            style: const TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Смотрите вывод в консоли',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Второй Container
            Container(
              width: 280,
              height: 130,
              color: Colors.green[600],
              margin: const EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  'Container 2 (базовый)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            // Дополнительный информационный блок
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber[200]),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 36,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Лабораторная работа выполнена!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '✓ Базовая верстка\n✓ FloatingActionButton\n✓ Expanded с CircleAvatar\n✓ Network Image',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        tooltip: 'Нажмите для вывода в консоль',
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.touch_app),
            if (_pressCount > 0)
              Text(
                '$_pressCount',
                style: const TextStyle(fontSize: 12),
              ),
          ],
        ),
      ),
      
      // Расположение FAB
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}