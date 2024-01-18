import 'package:chateo/src/packages/features/home/src/bloc/home_bloc.dart';
import 'package:chateo/src/packages/features/home/src/widgets/home_content.dart';
import 'package:chateo/src/packages/features/home/src/widgets/home_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //App Lifecycle
  late final AppLifecycleListener _listener;
  final List<String> _states = <String>[];
  late AppLifecycleState? _state;

  late final HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();

    Future.delayed(const Duration(seconds: 1), () {
      _bloc
        ..add(const GetChatUsersEvent())
        ..add(const UpdateUserStatusEvent(true));
    });

    _state = SchedulerBinding.instance.lifecycleState;
    _listener = AppLifecycleListener(
      onResume: () => _bloc.add(const UpdateUserStatusEvent(true)),
      onPause: () => _bloc.add(const UpdateUserStatusEvent(false)),
      onDetach: () => _bloc.add(const UpdateUserStatusEvent(false)),
    );
    if (_state != null) {
      _states.add(_state!.name);
    }
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return switch (state) {
            HomeLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            HomeError() => const HomeErrorWidget(),
            HomeSucces(chats: final chats, user: final user) => (user == null)
                ? const HomeErrorWidget()
                : HomeContent(
                    chats: chats,
                    user: user,
                  ),
          };
        },
      ),
    );
  }
}
