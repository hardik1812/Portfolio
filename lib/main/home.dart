import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:device_info_plus/device_info_plus.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final List<Widget> _history = [];

  @override
  void initState() {
    super.initState();
    _history.addAll([
      consoletext('Hardik DevShell', 17),
      consoletext('Copyright (C) Hardik Corporation. All rights reserved.'),
      consoletext(
        'Run the latest DevShell build for new features & improvements! https://hardikprem.dev',
        20,
      ),

      Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 5),
        child: Text(
          'This website is made for Desktop',
          style: const TextStyle(
            color: Colors.green,
            fontFamily: 'Consolas',
            fontSize: 17,
          ),
        ),
      ),
      Row(
        children: [
          consoletext('Start viewing my portfolio with ', 7),
          Padding(
            padding: const EdgeInsets.only(top: 7.0),
            child: Text(
              ' /help',
              style: const TextStyle(
                color: Colors.green,
                fontFamily: 'Consolas',
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
      consoletext(''),
    ]);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void _processCommand(String command) {
    final trimmedCommand = command.trim();
    if (trimmedCommand.isEmpty) {
      setState(() {
        _history.add(consoletext(r'PS C:\Users\hardi>'));
      });
      _scrollToBottom();
      return;
    }

    setState(() {
      _history.add(
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            children: [
              Text(
                r'PS C:\Users\hardi> ',
                style: const TextStyle(
                  color: Color(0xFFBEBEBE),
                  fontFamily: 'Consolas',
                  fontSize: 17,
                ),
              ),
              Text(
                trimmedCommand,
                style: const TextStyle(
                  color: Color(0xFFBEBEBE),
                  fontFamily: 'Consolas',
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      );

      if (trimmedCommand.toLowerCase() == '/help') {
        _history.add(
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.firaCode(
                  // Use a monospaced font
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5, // Adds nice spacing between lines
                  ),
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Available Commands:\n\n'),

                  // Main commands
                  TextSpan(
                    text: '  /help         ',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(text: '- Shows this list of commands.\n'),
                  TextSpan(
                    text: '  /about        ',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(text: '- A brief introduction about me.\n'),
                  TextSpan(
                    text: '  /contact      ',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(text: '- Displays contact information.\n\n'),
                  TextSpan(
                    text: '  /skills       ',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(text: '- Displays my technical skills.\n'),

                  TextSpan(
                    text: '  /projects     ',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(text: '- Lists my notable projects.\n'),

                  TextSpan(
                    text: '  /education    ',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(text: '- Shows my educational background.\n'),

                  // System commands
                  TextSpan(
                    text: '  /clear        ',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(text: '- Clears the terminal screen.'),
                ],
              ),
            ),
          ),
        );
      } else if (trimmedCommand.toLowerCase() == '/skills') {
        // In your _processCommand function, when the command is 'skills':

        _history.add(
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 350, // Adjust height as needed
              child: DataTable2(
                // --- GREEN ASCII BOX STYLING ---
                dataRowColor: MaterialStateProperty.all(Colors.black),
                headingRowColor: MaterialStateProperty.all(Colors.black),
                dividerThickness: 0,
                border: TableBorder(
                  top: BorderSide(color: Colors.green.shade400, width: 1),
                  bottom: BorderSide(color: Colors.green.shade400, width: 1),
                  left: BorderSide(color: Colors.green.shade400, width: 1),
                  right: BorderSide(color: Colors.green.shade400, width: 1),
                  horizontalInside: BorderSide(
                    color: Colors.green.shade700,
                    width: 0.5,
                  ),
                  verticalInside: BorderSide(
                    color: Colors.green.shade700,
                    width: 0.5,
                  ),
                ),
                columnSpacing: 0,
                horizontalMargin: 0,
                // --- END STYLING ---

                // --- ORIGINAL LAYOUT (COLUMNS) ---
                columns: [
                  DataColumn2(
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'CATEGORY',
                        style: GoogleFonts.firaCode(
                          color: Colors.green.shade400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    size: ColumnSize.M,
                  ),
                  DataColumn2(
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'SKILLSET',
                        style: GoogleFonts.firaCode(
                          color: Colors.green.shade400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    size: ColumnSize.L,
                  ),
                ],
                // --- END COLUMNS ---

                // --- ORIGINAL LAYOUT (ROWS) ---
                rows: const [
                  DataRow2(
                    cells: [
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Languages'),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Dart, Python, HTML,CSS,'),
                        ),
                      ),
                    ],
                  ),
                  DataRow2(
                    cells: [
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Frameworks'),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Flutter, Firebase,'),
                        ),
                      ),
                    ],
                  ),
                  DataRow2(
                    cells: [
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Databases'),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Firestore, SQL'),
                        ),
                      ),
                    ],
                  ),
                  DataRow2(
                    cells: [
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Tools'),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Git, Docker, VS Code,Android studio'),
                        ),
                      ),
                    ],
                  ),
                  DataRow2(
                    cells: [
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Design'),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Figma,Davinci Resolve,Adobe Photoshop'),
                        ),
                      ),
                    ],
                  ),
                  DataRow2(
                    cells: [
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Hobbies'),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Badminton,Dance,Video editing'),
                        ),
                      ),
                    ],
                  ),
                ],

                // --- END ROWS ---
                dataTextStyle: GoogleFonts.firaCode(
                  textStyle: TextStyle(
                    color: Colors.green.shade300,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        );
      } else if (trimmedCommand.toLowerCase() == '/projects') {
        // In your _processCommand function, for the '/projects' command:
        _history.add(
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.firaCode(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        '> Querying project database... 3 projects found.\n\n',
                  ),

                  // Project 1
                  TextSpan(
                    text: '[1] Sales Management\n',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(
                    text: '    └── ',
                    style: TextStyle(color: Colors.green.shade900),
                  ),
                  TextSpan(
                    text: 'About: ',
                    style: TextStyle(color: Colors.green.shade300),
                  ),
                  TextSpan(
                    text: 'It helps employees and owners to manage customers\n',
                  ),
                  TextSpan(
                    text: '    └── ',
                    style: TextStyle(color: Colors.green.shade900),
                  ),
                  TextSpan(
                    text: 'Does:  ',
                    style: TextStyle(color: Colors.green.shade300),
                  ),
                  TextSpan(
                    text:
                        'Allows users to put customer details and record all the details between customer and employer.\n\n',
                  ),

                  // Project 2
                  TextSpan(
                    text: '[2] Caloriq\n',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(
                    text: '    └── ',
                    style: TextStyle(color: Colors.green.shade900),
                  ),
                  TextSpan(
                    text: 'About: ',
                    style: TextStyle(color: Colors.green.shade300),
                  ),
                  TextSpan(text: 'A mobile App to track calorie.\n'),
                  TextSpan(
                    text: '    └── ',
                    style: TextStyle(color: Colors.green.shade900),
                  ),
                  TextSpan(
                    text: 'Does:  ',
                    style: TextStyle(color: Colors.green.shade300),
                  ),
                  TextSpan(
                    text:
                        'Scanning the barcodes the user can track his daily calorie consumtion and plan his meals\n\n',
                  ),

                  // Project 3
                  TextSpan(
                    text:
                        '[3] My personal portfolio designed as an interactive terminal.\n',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(
                    text: '    └── ',
                    style: TextStyle(color: Colors.green.shade900),
                  ),
                  TextSpan(
                    text: 'Does:  ',
                    style: TextStyle(color: Colors.green.shade300),
                  ),
                  TextSpan(
                    text:
                        'Showcases my skills and projects in a creative, command-line interface.',
                  ),
                ],
              ),
            ),
          ),
        );
      } else if (trimmedCommand.toLowerCase() == '/clear') {
        _history.clear();
      } else if (trimmedCommand.toLowerCase() == '/education') {
        _history.add(
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 300, // Adjust height based on number of rows
              child: DataTable2(
                // --- GREEN ASCII BOX STYLING ---
                dataRowColor: MaterialStateProperty.all(Colors.black),
                headingRowColor: MaterialStateProperty.all(Colors.black),
                dividerThickness: 0,
                border: TableBorder(
                  top: BorderSide(color: Colors.green.shade400, width: 1),
                  bottom: BorderSide(color: Colors.green.shade400, width: 1),
                  left: BorderSide(color: Colors.green.shade400, width: 1),
                  right: BorderSide(color: Colors.green.shade400, width: 1),
                  horizontalInside: BorderSide(
                    color: Colors.green.shade700,
                    width: 0.5,
                  ),
                  verticalInside: BorderSide(
                    color: Colors.green.shade700,
                    width: 0.5,
                  ),
                ),
                columnSpacing: 0,
                horizontalMargin: 0,
                // --- END STYLING ---

                // Define table columns
                columns: const [
                  DataColumn2(label: Text('DEGREE / CERTIFICATE')),
                  DataColumn2(label: Text('INSTITUTION'), size: ColumnSize.L),
                  DataColumn2(label: Text('YEAR'), size: ColumnSize.S),
                ],

                // Add your education details here
                rows: [
                  DataRow2(
                    cells: [
                      DataCell(Text('B.Tech, Computer Science')),
                      DataCell(Text('Vellore Institute of Technology Chennai')),
                      DataCell(Text('2025 - 2029')),
                    ],
                  ),
                  DataRow2(
                    cells: [
                      DataCell(Text('Class XII (AISSCE)')),
                      DataCell(
                        Text('Alphonsa English Medium School Thamarassery'),
                      ),
                      DataCell(Text('2025')),
                    ],
                  ),
                  DataRow2(
                    cells: [
                      DataCell(Text('Flutter Development')),
                      DataCell(Text('Tutedude (Online)')),
                      DataCell(Text('2025')),
                    ],
                  ),
                  DataRow2(
                    cells: [
                      DataCell(Text('Python(Basics)')),
                      DataCell(Text('HackerRank')),
                      DataCell(Text('2025')),
                    ],
                  ),
                ],

                // Apply global text styles for the terminal look
                headingTextStyle: GoogleFonts.firaCode(
                  textStyle: TextStyle(
                    color: Colors.green.shade400,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                dataTextStyle: GoogleFonts.firaCode(
                  textStyle: TextStyle(
                    color: Colors.green.shade300,
                    fontSize: 16,
                  ),
                ),

                // Add padding to all cells for better spacing
              ),
            ),
          ),
        );
      } else if (trimmedCommand.toLowerCase() == '/about') {
        _history.add(
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.firaCode(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.7, // Good line spacing for readability
                  ),
                ),
                children: [
                  TextSpan(text: '> Running get-bio...\n\n'),

                  TextSpan(text: "Hey there! I’m a curious and enthusiastic "),
                  TextSpan(
                    text: 'Flutter developer ',
                    style: TextStyle(
                      color: Colors.cyan.shade300,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        "and Computer Science student at VIT, Chennai. I love taking tricky problems and turning them into smooth, fun, and easy-to-use mobile apps. For me, building software isn’t just about code—it’s about creating something people genuinely enjoy using.\n\n",
                  ),

                  TextSpan(text: "I believe in writing "),
                  TextSpan(
                    text: 'clean, scalable code ',
                    style: TextStyle(color: Colors.green.shade300),
                  ),
                  TextSpan(
                    text:
                        "and putting extra care into the little UI/UX details that make an app feel just right. From crafting responsive Flutter front-ends to building solid backends with ",
                  ),
                  TextSpan(
                    text: 'Firebase ',
                    style: TextStyle(color: Colors.amber.shade300),
                  ),
                  TextSpan(
                    text:
                        "—my focus is always on making things work beautifully and effortlessly.\n\n",
                  ),

                  TextSpan(
                    text:
                        "This terminal is just one of my little creative experiments. I’m always exploring new tools, learning cool stuff, and finding ways to level up. Want to see what I’ve been working on? Try the ",
                  ),
                  TextSpan(
                    text: '/projects',
                    style: TextStyle(color: Colors.purple.shade200),
                  ),
                  TextSpan(
                    text:
                        ' command. Or, if you feel like saying hi, just type ',
                  ),
                  TextSpan(
                    text: '/contact',
                    style: TextStyle(color: Colors.purple.shade200),
                  ),
                  TextSpan(text: '.'),
                ],
              ),
            ),
          ),
        );
      } else if (trimmedCommand.toLowerCase() == '/contact') {
        _history.add(
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.firaCode(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                children: <TextSpan>[
                  TextSpan(text: '> Initiating contact sequence...\n\n'),
                  TextSpan(
                    text:
                        "// You can reach out to me here. I'm open to new opportunities.\n\n",
                    style: TextStyle(
                      color: Colors.green.shade300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  // Email
                  TextSpan(
                    text: '  Email       : ',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(
                    text: 'hardikprem1234@gmail.com\n',
                    style: TextStyle(color: Colors.amber.shade300),
                  ),

                  // Phone
                  TextSpan(
                    text: '  Phone       : ',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(
                    text: '+91 7306686671\n',
                    style: TextStyle(color: Colors.amber.shade300),
                  ),

                  // Instagram
                  TextSpan(
                    text: '  Instagram   : ',
                    style: TextStyle(color: Colors.cyan.shade300),
                  ),
                  TextSpan(
                    text: '@hardik_prem_1298\n',
                    style: TextStyle(color: Colors.amber.shade300),
                  ),

                  // LinkedIn
                ],
              ),
            ),
          ),
        );
      } else {
        _history.add(
          Text(
            "bash: syntax error near unexpected token '${trimmedCommand}' try /help",
            style: TextStyle(
              color: Color(0xFFE74856),
              fontSize: 17,
              fontFamily: 'Consolas',
            ),
          ),
        );
      }
    });

    _controller.clear();
    _scrollToBottom();
    _focusNode.requestFocus();
  }

  Widget _buildInputLine() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 5),
      child: Row(
        children: [
          const Text(
            r'PS C:\Users\hardi> ',
            style: TextStyle(
              color: Color(0xFFBEBEBE),
              fontFamily: 'Consolas',
              fontSize: 17,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              autofocus: true,
              onSubmitted: _processCommand,
              style: const TextStyle(
                color: Color(0xFFBEBEBE),
                fontFamily: 'Consolas',
                fontSize: 17,
              ),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.deepPurple[300],
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image(
                      image: AssetImage(r'Assets\images\gradiant.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,

                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                  image: AssetImage(
                                    r'Assets\images\IMG-20250707-WA0005.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          consoletext('Hey guys 😁'),

                          Text(
                            "I'm so glad you're here! You've arrived at the very beginning of my development journey. Consider these first few projects as the seeds of my portfolio. I'm spending my time nurturing my skills and learning how to grow bigger and better things. This little garden is destined to become a forest, so please visit again to see what has bloomed!",
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFFBEBEBE),
                              fontFamily: 'Consolas',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xFF0C0C0C),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: const Color(0xFF2C2C2C),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 11.0),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              width: 300,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFF0B0B0B),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.terminal,
                                    color: Color(0xFF3D6CBC),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 14.0),
                                    child: Text(
                                      'Hardik Devshell',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              bottom: 10,
                              right: 10,
                            ),
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                          Center(
                            child: Container(
                              width: 0.5,
                              height: 30,
                              color: Colors.grey,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _focusNode.requestFocus(),
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.only(left: 5),
                        itemCount: _history.length + 1,
                        itemBuilder: (context, index) {
                          if (index < _history.length) {
                            return _history[index];
                          } else {
                            return _buildInputLine();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> isDesktop() async {
    if (kIsWeb) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      String? userAgent = webBrowserInfo.userAgent;

      if (userAgent != null && !userAgent.contains('Mobi')) {
        return true; // It's a desktop
      }
    }
    return false; // It's mobile or not a web platform
  }

  Padding consoletext(String str, [double top = 0]) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: top),
      child: Text(
        str,
        style: const TextStyle(
          color: Color(0xFFBEBEBE),
          fontFamily: 'Consolas',
          fontSize: 17,
        ),
      ),
    );
  }
}
