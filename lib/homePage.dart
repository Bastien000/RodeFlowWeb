import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool downloadHover = false;
  bool logoSpin = false;
  bool firstTile = false;
  bool secondTile = false;
  bool thirdTile = false;
  bool fourTile = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 800;
          final isMediumScreen = constraints.maxWidth < 1200;

          double getResponsiveFontSize(double baseSize) {
            if (isSmallScreen) {
              return baseSize * 0.5;
            } else if (isMediumScreen) {
              return baseSize * 0.7;
            }
            return baseSize;
          }

          return Container(
            width: constraints.maxWidth,
            color: Colors.black87,
            child: ListView(
              controller: _scrollController,
              padding:
                  EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 100),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 20,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MouseRegion(
                            onEnter: (event) => setState(() => logoSpin = true),
                            onExit: (event) => setState(() => logoSpin = false),
                            child: Image.asset(
                              "photos/logo.png",
                              scale: 12,
                            ).animate(target: logoSpin ? 1 : 0).rotate(
                                begin: 1,
                                end: 2,
                                curve: const ElasticInOutCurve(),
                                duration: const Duration(seconds: 2)),
                          ),
                          const Text(
                            "RodeFlow",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          MouseRegion(
                            onEnter: (event) =>
                                setState(() => downloadHover = true),
                            onExit: (event) =>
                                setState(() => downloadHover = false),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    actionsAlignment: MainAxisAlignment.center,
                                    backgroundColor: const Color.fromARGB(
                                        255, 139, 139, 139),
                                    icon: Image.asset(
                                      "photos/logo.png",
                                      width: 60,
                                      height: 60,
                                    ),
                                    title: Text(
                                      'Download Unavailable',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: getResponsiveFontSize(30),
                                      ),
                                    ),
                                    content: Text(
                                      'We apologize, but downloading has been temporarily\nsuspended due to application maintenance.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: getResponsiveFontSize(20),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text(
                                          'OK',
                                          style: TextStyle(
                                              foreground: Paint()
                                                ..shader = const LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        255, 255, 0, 212),
                                                    Color.fromARGB(
                                                        255, 255, 238, 0)
                                                  ],
                                                ).createShader(
                                                    const Rect.fromLTWH(
                                                        0, 0, 1500, 200000)),
                                              fontSize:
                                                  getResponsiveFontSize(15),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Download",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                                  .animate(target: downloadHover ? 1 : 0)
                                  .scale(
                                      begin: const Offset(1, 1),
                                      end: const Offset(1.2, 1.2))
                                  .shake(),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: isSmallScreen ? 50 : 100),
                Center(
                  child: Text(
                    " welcome to the",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getResponsiveFontSize(80),
                        fontWeight: FontWeight.bold),
                  ),
                )
                    .animate()
                    .fadeIn(
                        duration: const Duration(seconds: 1),
                        curve: Curves.decelerate)
                    .slideY(
                        duration: const Duration(seconds: 1),
                        begin: 0.5,
                        curve: Curves.decelerate),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        "next generation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 255, 0, 212),
                                  Color.fromARGB(255, 255, 238, 0)
                                ],
                              ).createShader(
                                  const Rect.fromLTWH(0, 0, 750, 200)),
                            fontSize: getResponsiveFontSize(80),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " of cycling",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getResponsiveFontSize(80),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
                    .animate(delay: const Duration(milliseconds: 500))
                    .fadeIn(
                        duration: const Duration(seconds: 1),
                        curve: Curves.decelerate)
                    .slideY(
                        duration: const Duration(seconds: 1),
                        begin: 0.5,
                        curve: Curves.decelerate),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "Track your race results, explore detailed cycling stats \nand connect with fellow riders through shared activities.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: getResponsiveFontSize(30),
                    ),
                  ).animate(delay: const Duration(seconds: 2)).fadeIn(
                      duration: const Duration(seconds: 1),
                      curve: Curves.decelerate),
                ),
                SizedBox(height: isSmallScreen ? 100 : 200),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          "Perform at your",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getResponsiveFontSize(40),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " highest ",
                          style: TextStyle(
                              foreground: Paint()
                                ..shader = const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 255, 0, 212),
                                    Color.fromARGB(255, 255, 238, 0)
                                  ],
                                ).createShader(
                                    const Rect.fromLTWH(0, 0, 800, 50)),
                              fontSize: getResponsiveFontSize(40),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "level",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getResponsiveFontSize(40),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "RodeFlow is built for cyclists who want more than just tracking \nit's your companion for performance, progress, and community.\nDesigned to support your cycling journey, it helps you stay motivated,\ninformed, and connected every ride.",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: getResponsiveFontSize(24),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                if (isMediumScreen)
                  _buildTilesColumn(isSmallScreen)
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildTilesColumn(isSmallScreen)),
                      const Spacer(),
                      const StackedCards(),
                    ],
                  ),
                const SizedBox(height: 50),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        width: constraints.maxWidth,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 0, 212),
                              Color.fromARGB(255, 255, 238, 0),
                            ],
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(duration: const Duration(seconds: 1))
                          .slideX(
                              curve: Curves.decelerate,
                              begin: -1,
                              end: 0,
                              duration: const Duration(seconds: 2)),
                    ),
                    Center(
                      child: Container(
                        width: constraints.maxWidth,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 0, 212),
                              Color.fromARGB(255, 255, 238, 0),
                            ],
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(duration: const Duration(seconds: 1))
                          .slideX(
                              curve: Curves.decelerate,
                              begin: 1,
                              end: 0,
                              duration: const Duration(seconds: 2)),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                // Footer section
                _buildFooter(isSmallScreen),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTilesColumn(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoTile(
          isHovered: firstTile,
          onEnter: () => setState(() => firstTile = true),
          onExit: () => setState(() => firstTile = false),
          title: "Track your activities",
          content:
              "Monitor your rides, analyze your stats, and see your progress over time.\nGet detailed insights into your cycling sessions, including distance, speed, elevation, and calories burned.\nVisualize your improvements with interactive charts\nand stay motivated as you reach new milestones on every ride.",
          target: firstTile ? 1.0 : 0.0,
        ),
        const SizedBox(height: 40),
        _buildInfoTile(
          isHovered: secondTile,
          onEnter: () => setState(() => secondTile = true),
          onExit: () => setState(() => secondTile = false),
          title: "Compare your self with the best",
          content:
              "Compare your performance metrics with elite cyclists, see where you stand\nand set goals based on professional benchmarks. Challenge yourself with leaderboards\ntrack your improvements, and celebrate your achievements\nas you climb the ranks among the best riders.",
          target: secondTile ? 1.0 : 0.0,
        ),
        const SizedBox(height: 40),
        _buildInfoTile(
          isHovered: thirdTile,
          onEnter: () => setState(() => thirdTile = true),
          onExit: () => setState(() => thirdTile = false),
          title: "Connect with others",
          content:
              "Join a vibrant community of cyclists, share your achievements\nand discover new routes and friends to ride with. Engage in group rides, exchange tips\n and motivate each other to reach new goals.\nStay connected, inspired, and make every ride a shared adventure.",
          target: thirdTile ? 1.0 : 0.0,
        ),
        const SizedBox(height: 40),
        _buildInfoTile(
          isHovered: fourTile,
          onEnter: () => setState(() => fourTile = true),
          onExit: () => setState(() => fourTile = false),
          title: "Exciting New Features",
          content:
              "Discover new features that take your cycling experience to the next level.\nPlan routes, track your performance in real time, and get personalized recommendations to improve your training.\nRodeFlow is constantly innovating to provide you with the best tools for your growth.\n\nStay tuned for upcoming integrations with smart devices, advanced analytics, and social challenges.\nEnjoy seamless syncing across all your devices, and benefit from regular updates that keep you ahead of the pack.\nYour feedback shapes our roadmap—help us build the ultimate platform for every cyclist.",
          target: fourTile ? 1.0 : 0.0,
        ),
      ],
    );
  }

  Widget _buildInfoTile({
    required bool isHovered,
    required VoidCallback onEnter,
    required VoidCallback onExit,
    required String title,
    required String content,
    required double target,
  }) {
    return MouseRegion(
      onEnter: (_) => onEnter(),
      onExit: (_) => onExit(),
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? const Color.fromARGB(156, 255, 255, 255)
                    : Colors.transparent,
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
            color: Colors.white54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 0, 212),
                          Color.fromARGB(255, 255, 238, 0)
                        ],
                      ).createShader(const Rect.fromLTWH(0, 0, 400, 200)),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ).animate(target: target).scale(
            begin: const Offset(1, 1),
            end: const Offset(1.1, 1.1),
            curve: Curves.decelerate),
      ),
    );
  }

  Widget _buildFooter(bool isSmallScreen) {
    final footerContent = [
      Image.asset(
        "photos/logo2.png",
        height: 60,
      ),
      SizedBox(width: isSmallScreen ? 0 : 20, height: isSmallScreen ? 20 : 0),
      TextButton.icon(
        onPressed: () {
          // Otevře GitHub v prohlížeči
          // použijte url_launcher pokud chcete funkční odkaz
        },
        icon: const Icon(Icons.code, color: Colors.white),
        label: const Text(
          "GitHub",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(width: isSmallScreen ? 0 : 10, height: isSmallScreen ? 10 : 0),
      TextButton.icon(
        onPressed: () {
          // Otevře profil autora
        },
        icon: const Icon(Icons.person, color: Colors.white),
        label: const Text(
          "Sebastián Ondruška",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(width: isSmallScreen ? 0 : 10, height: isSmallScreen ? 10 : 0),
      TextButton.icon(
        onPressed: () {
          // Otevře email klienta
        },
        icon: const Icon(Icons.email, color: Colors.white),
        label: const Text(
          "sondruska@email.cz",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ];

    return Column(
      children: [
        isSmallScreen
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: footerContent,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: footerContent,
              ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          style: ButtonStyle(
            elevation: WidgetStateProperty.all<double>(8),
            backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () async {
            // Scroll pomalu nahoru
            await _scrollController.animateTo(
              0,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
            );
          },
          icon: const Icon(Icons.arrow_upward, color: Colors.black),
          label: const Text(
            "Back on top",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "© 2025 RodeFlow. All rights reserved.",
          style: TextStyle(color: Colors.white54),
        ),
      ],
    );
  }
}

class StackedCards extends StatefulWidget {
  const StackedCards({Key? key}) : super(key: key);

  @override
  State<StackedCards> createState() => _StackedCardsState();
}

class _StackedCardsState extends State<StackedCards> {
  bool isHovered = false;
  final List<Map<String, String>> cards = [
    {"image": "photos/remco.png", "label": "Racer"},
    {"image": "photos/tadej.png", "label": "Race "},
    {"image": "photos/coffe.png", "label": "Post "},
  ];
  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.sizeOf(context).width * 0.22;
    double cardHeight = MediaQuery.sizeOf(context).height * 0.9;

    // MouseRegion zachytává události najetí/odjetí myši pro animaci karet
    return MouseRegion(
      // Nastaví stav hoveru na true při najetí myši
      onEnter: (_) => setState(() => isHovered = true),
      // Nastaví stav hoveru na false při opuštění myši
      onExit: (_) => setState(() => isHovered = false),
      child: SizedBox(
        // Nastaví šířku a výšku oblasti pro karty
        width: cardWidth + 80,
        height: cardHeight + 40,
        child: Stack(
          clipBehavior: Clip.none,
          // Vygeneruje widgety pro každou kartu
          children: List.generate(cards.length, (i) {
            // Výpočet pozice, úhlu natočení a "hloubky" podle stavu hoveru
            double dx, angle, dz;
            if (isHovered) {
              // Karty se rozloží doleva při hoveru
              dx = (i + -1) * (cardWidth * 0.7);
              angle = 0;
              dz = 0;
            } else {
              // Karty jsou více přes sebe a natočené bez hoveru
              dx = i * 30.0;
              angle =
                  (i - 1) * 0.08; // prostřední karta rovně, ostatní natočené
              dz = (cards.length - i) * 10.0;
            }
            return AnimatedPositioned(
              // Animuje pozici při změně stavu
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              left: dx,
              top: i * 10.0,
              child: AnimatedContainer(
                // Animuje velikost a transformace
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
                width: cardWidth,
                height: cardHeight,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateZ(angle)
                  ..translate(0.0, 0.0, dz),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(0, 0, 0, 0),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Obrázek karty
                      Image.asset(
                        cards[i]["image"]!,
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
