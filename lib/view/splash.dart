import 'package:flutter/material.dart';
import 'package:study_case/cache/cache.dart';
import 'package:study_case/view/login_view.dart';
import 'package:study_case/view/user_list_view.dart';

class SplahsView extends StatefulWidget {
  @override
  State<SplahsView> createState() => _SplahsViewState();
}

class _SplahsViewState extends State<SplahsView> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..animateTo(10);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );
  @override
  void initState() {
    onLoad();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: FadeTransition(
          opacity: _animation,
          child: Center(
            child: Text('Study Case'),
          ),
        ),
      ),
    );
  }

  Future onLoad() async {
    Future.delayed(const Duration(seconds: 3), () {
      var token = Cache().getString('token');
      if (token == null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => LoginView()));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => UserListView()));
      }
    });
  }
}
