
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fading Scroller (naive implementation)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FadingScroller(
        builder: (context, scrollController) => ListView.builder(
          controller: scrollController,
          itemCount: 20,
          itemBuilder: (context, index) => ListTile(
            leading: const Icon(Icons.icecream),
            title: Text('Lorem ipsum #${index + 1}'),
          ),
        ),
      ),
    );
  }
}

class FadingScroller extends StatefulWidget {
  final Widget Function(BuildContext context, ScrollController scrollController)
      builder;

  final ScrollController? scrollController;

  const FadingScroller({
    Key? key,
    this.scrollController, required this.builder,
  }) : super(key: key);
     

  @override
  State<FadingScroller> createState() => _FadingScrollerState();
}

class _FadingScrollerState extends State<FadingScroller> {
  late final ScrollController _scrollController;

  bool _overlayIsVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_handleScrollUpdate);
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      // Only dispise if it was _us_ creating the controller.
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _handleScrollUpdate() {
    if (_scrollController.position.extentAfter <= 0) {
      setState(() {
        _overlayIsVisible = false;
      });
    } else {
      setState(() {
        _overlayIsVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.builder(context, _scrollController),
        IgnorePointer(
          child: AnimatedOpacity(
            opacity: _overlayIsVisible ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00FFFFFF),
                    Color(0xFFFFFFFF),
                  ],
                  stops: [
                    0.65,
                    1,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


