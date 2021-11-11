import 'package:flutter/material.dart';

class PagesApp extends StatelessWidget {
  const PagesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: "PageView example"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int? pageViewIndex;

class _MyHomePageState extends State<MyHomePage> {
  ActionMenu? actionMenu;
  final PageController pageController = PageController();
  int currentPageIndex = 0;
  int pageCount = 1;

  @override
  void initState() {
    super.initState();
    actionMenu = ActionMenu(addPageView, removePageView);
  }

  addPageView() {
    setState(() {
      pageCount++;
    });
  }

  removePageView(BuildContext context) {
    if (pageCount > 1) {
      setState(() {
        pageCount--;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Last page"),
      ));
    }
  }

  navigateToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  getCurrentPage(int page) {
    pageViewIndex = page;
  }

  createPage(int page) {
    return Center(
      child: Text('Page $page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          actionMenu!,
        ],
      ),
      body: PageView.builder(
        controller: pageController,
        onPageChanged: getCurrentPage,
        itemBuilder: (context, position) {
          // if (position == 5) {
          //   return null;
          // }
          return createPage(position + 1);
        },
      ),
    );
  }
}

enum MenuOptions { addPageAtEnd, deletePageCurrent }
List<Widget> listPageView = [];

class ActionMenu extends StatelessWidget {
  final Function addPageView, removePageView;
  const ActionMenu(this.addPageView, this.removePageView);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOptions>(
      onSelected: (MenuOptions value) {
        switch (value) {
          case MenuOptions.addPageAtEnd:
            addPageView();
            break;
          case MenuOptions.deletePageCurrent:
            removePageView(context);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<MenuOptions>>[
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.addPageAtEnd,
          child: Text('Add Page at End'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.deletePageCurrent,
          child: Text('Delete Current Page'),
        ),
      ],
    );
  }
}