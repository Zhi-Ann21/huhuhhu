import 'package:electrolex/analogicsdetail.dart';
import 'package:flutter/material.dart';
import 'componentdetails.dart';
import 'diodes.dart';
import 'capacitordetail.dart';
import 'resistordetail.dart';
import 'amplifiersdetail.dart';
import 'transistordetail.dart';
import 'ledsdetail.dart';
import 'switches.dart';
import 'fuses.dart';
import 'sensors.dart';
import 'connectors.dart';

void main() {
  runApp(ElectroLexApp());
}

final ValueNotifier<bool> isDarkMode = ValueNotifier(false);

const Map<String, Map<String, String>> translations = {
  'English': {},
  'Filipino': {
    'home': 'Bahay',
    'search': 'Paghahanap',
    'settings': 'Mga Setting',
    'categories': 'Mga Kategorya',
    'darkMode': 'Madilim na Mode',
    'language': 'Wika',
    'noComponentsFound': 'Walang nahanap na bahagi',
    'searchHint': 'Maghanap ng mga bahagi...',
    'noResults': 'Walang resulta',
    'detailsFor': 'Detalye para sa',
    'electroLex': 'ElectroLex',
    'electronicsReference':
        'Mga Kagamitan ng Elektronika at mga Tool ng Reference',
    'others': 'Iba pa',
  },
  'Chinese': {
    'electroLex': '電萊克斯',
    'home': '主页',
    'search': '搜索',
    'settings': '设置',
    'categories': '类别',
    'darkMode': '黑暗模式',
    'language': '语言',
    'noComponentsFound': '没有找到组件',
    'searchHint': '搜索组件...',
    'noResults': '没有结果',
    'detailsFor': '详情',
    'electronicsReference': '电子元件参考工具',
    'others': '其他',
  },
  'Korean': {
    'home': '홈',
    'search': '검색',
    'settings': '설정',
    'categories': '카테고리',
    'darkMode': '다크 모드',
    'language': '언어',
    'noComponentsFound': '컴포넌트를 찾을 수 없습니다',
    'searchHint': '부품 검색...',
    'noResults': '결과 없음',
    'detailsFor': '세부 사항',
    'electroLex': '일렉트로렉스',
    'electronicsReference': '전자 부품 참조 도구',
    'others': '기타',
  },
  'Spanish': {
    'home': 'Inicio',
    'search': 'Buscar',
    'settings': 'Configuraciones',
    'categories': 'Categorías',
    'darkMode': 'Modo oscuro',
    'language': 'Idioma',
    'noComponentsFound': 'No se encontraron componentes',
    'searchHint': 'Buscar componentes...',
    'noResults': 'No hay resultados',
    'detailsFor': 'Detalles de',
    'electroLex': 'ElectroLex',
    'electronicsReference':
        'Herramientas de referencia de componentes electrónicos',
    'others': 'Otros',
  },
};

class ElectroLexApp extends StatelessWidget {
  const ElectroLexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkMode,
      builder: (context, darkMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ElectroLex',
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Color(0xFFEAF4FF),
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.grey[900],
            primarySwatch: Colors.blue,
          ),
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          home: ElectroLexHome(),
        );
      },
    );
  }
}

class ElectroLexHome extends StatefulWidget {
  const ElectroLexHome({super.key});

  @override
  State<ElectroLexHome> createState() => _ElectroLexHomeState();
}

class _ElectroLexHomeState extends State<ElectroLexHome> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _language = 'English'; // Default language is English

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Analog\n   ICs',
      'icon': Icons.electrical_services,
      'color': Colors.blue,
    },
    {'title': 'Resistors', 'icon': Icons.linear_scale, 'color': Colors.orange},
    {
      'title': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {'title': 'Diodes', 'icon': Icons.flash_on, 'color': Colors.red},
    {'title': 'Transistors', 'icon': Icons.toggle_on, 'color': Colors.purple},
    {'title': 'LEDs', 'icon': Icons.lightbulb, 'color': Colors.amber},
    {'title': 'Sensors', 'icon': Icons.sensors, 'color': Colors.teal},
    {
      'title': 'Connectors',
      'icon': Icons.usb,
      'color': const Color.fromARGB(255, 30, 0, 150),
    },
    {'title': 'Amplifiers', 'icon': Icons.volume_up, 'color': Colors.blue},
    {'title': 'Switches', 'icon': Icons.toggle_on, 'color': Colors.lightBlue},
    {'title': 'Fuses', 'icon': Icons.power_off, 'color': Colors.redAccent},
    {'title': 'Others', 'icon': Icons.more_horiz, 'color': Colors.grey},
  ];

  final List<Map<String, dynamic>> othersComponents = [
    {'title': 'Micromotors', 'icon': Icons.headphones, 'color': Colors.pink},
    {
      'title': 'Clock and Timing',
      'icon': Icons.access_time,
      'color': Colors.indigo,
    },
    {'title': 'Oscillators', 'icon': Icons.auto_awesome, 'color': Colors.green},
    {
      'title': 'Development\n Tools',
      'icon': Icons.developer_board,
      'color': Colors.purple,
    },
    {
      'title': 'Display Drivers',
      'icon': Icons.display_settings,
      'color': Colors.cyan,
    },
    {
      'title': 'Electro\n mechanical\n Components',
      'icon': Icons.build_circle,
      'color': Colors.blueGrey,
    },
    {
      'title': 'Embedded\n Controllers',
      'icon': Icons.control_camera,
      'color': Colors.amber,
    },
    {
      'title': 'Filters\n Optimization',
      'icon': Icons.tune,
      'color': Colors.green,
    },
    {
      'title': 'Functional\n  Modules',
      'icon': Icons.extension,
      'color': Colors.lime,
    },
    {
      'title': 'Hardware/Solders/Batteries',
      'icon': Icons.build,
      'color': Colors.brown,
    },
    {'title': 'Inductors', 'icon': Icons.all_inclusive, 'color': Colors.indigo},
    {
      'title': 'Interface ICs',
      'icon': Icons.input,
      'color': Colors.purpleAccent,
    },
    {
      'title': 'IoT\n  Communication',
      'icon': Icons.wifi,
      'color': Colors.tealAccent,
    },
    {'title': 'Logic ICs', 'icon': Icons.memory, 'color': Colors.blueAccent},
    {'title': 'Memory', 'icon': Icons.sd_storage, 'color': Colors.orangeAccent},
    {'title': 'Rf & Radio', 'icon': Icons.radio, 'color': Colors.red},
  ];

  List<Map<String, dynamic>> get allComponents => [
    ...categories,
    ...othersComponents,
  ];

  List<Map<String, dynamic>> get filteredComponents {
    return allComponents
        .where(
          (component) => component['title'].toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ),
        )
        .toList();
  }

  void _toggleLanguage() {
    setState(() {
      if (_language == 'English') {
        _language = 'Filipino';
      } else if (_language == 'Filipino') {
        _language = 'Chinese';
      } else if (_language == 'Chinese') {
        _language = 'Korean';
      } else if (_language == 'Korean') {
        _language = 'Spanish';
      } else {
        _language = 'English';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'EL',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    translations[_language]!['electroLex']!,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    translations[_language]!['electronicsReference']!,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: 380,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                padding: EdgeInsets.all(4),
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  indicatorColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(text: translations[_language]!['home']!),
                    Tab(text: translations[_language]!['search']!),
                    Tab(text: translations[_language]!['settings']!),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildHomeTab(context),
                    _buildSearchTab(),
                    _buildSettingsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeTab(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            translations[_language]!['categories']!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
            children:
                categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      if (category['title'] == 'Others') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => OthersCategoryPage(othersComponents),
                          ),
                        );
                      } else if (category['title'] == 'Analog\n   Ics') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AnalogdetailPage()),
                        );
                      } else if (category['title'] == 'Diodes') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => DiodeDetailPage()),
                        );
                      } else if (category['title'] == 'Capacitors') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CapacitorsDetailPage(),
                          ),
                        );
                      } else if (category['title'] == 'Resistors') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResistorDetailPage(),
                          ),
                        );
                      } else if (category['title'] == 'Amplifiers') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AmplifiersDetailPage(),
                          ),
                        );
                      } else if (category['title'] == 'Transistors') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TransistorDetailPage(),
                          ),
                        );
                      } else if (category['title'] == 'LEDs') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LEDsDetailPage()),
                        );
                      } else if (category['title'] == 'Switches') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SwitchesDetailPage(),
                          ),
                        );
                      } else if (category['title'] == 'Analog\n   Ics') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AnalogdetailPage()),
                        );
                      } else if (category['title'] == 'Fuses') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => FusesDetailPage()),
                        );
                      } else if (category['title'] == 'Sensors') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SensorsDetailPage(),
                          ),
                        );
                      } else if (category['title'] == 'Connectors') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ConnectorsDetailPage(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => ComponentDetailPage(category['title']),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: category['color'],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              category['icon'],
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            category['title'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: translations[_language]!['searchHint']!,
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Expanded(
          child:
              filteredComponents.isEmpty
                  ? Center(
                    child: Text(translations[_language]!['noComponentsFound']!),
                  )
                  : GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                    children:
                        filteredComponents
                            .where(
                              (component) => component['title'] != 'Others',
                            ) // Exclude 'Others' category
                            .map((component) {
                              return GestureDetector(
                                onTap: () {
                                  if (component['title'] == 'Resistors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ResistorDetailPage(),
                                      ), // Navigate to ResistorDetailPage
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => ComponentDetailPage(
                                              component['title'],
                                            ),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: component['color'],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          component['icon'],
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        component['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                            .toList(),
                  ),
        ),
      ],
    );
  }

  Widget _buildSettingsTab() {
    return Column(
      children: [
        ListTile(
          title: Text(translations[_language]!['darkMode']!),
          trailing: IconButton(
            icon: Icon(
              isDarkMode.value ? Icons.wb_sunny : Icons.nightlight_round,
              color: isDarkMode.value ? Colors.yellow : Colors.blueGrey,
            ),
            onPressed: () {
              setState(() {
                isDarkMode.value = !isDarkMode.value; // Toggle dark mode
              });
            },
          ),
        ),
        ListTile(
          title: Text(translations[_language]!['language']!),
          trailing: IconButton(
            icon: Icon(Icons.language),
            onPressed: _toggleLanguage,
          ),
        ),
      ],
    );
  }
}

class OthersCategoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> components;

  const OthersCategoryPage(this.components, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Others")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1,
          children:
              components.map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ComponentDetailPage(item['title']),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: item['color'],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            item['icon'],
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            item['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
