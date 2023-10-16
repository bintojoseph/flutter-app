import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/application/home/home_bloc.dart';
import 'package:exercise_app/core/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHomePage extends StatelessWidget {
  const ScreenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Topbar(),
        SizedBox(
          height: 10,
        ),
        ListWidget()
      ],
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.getHomeData());
    });
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return ListView.separated(
              itemBuilder: ((context, index) {
                return MenuCardWidget(
                  index: index,
                );
              }),
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 10,
                );
              }),
              itemCount: state.homedata.length);
        },
      ),
    );
  }
}

class MenuCardWidget extends StatelessWidget {
  final int index;
  const MenuCardWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            AutoRouter.of(context).push(RouteDetailsRoute(id: state.homedata[index].id));
          },
          child: Container(
            color: Color.fromARGB(255, 165, 93, 117),
            height: 120,
            width: double.infinity,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            state.homedata[index].imgUrl,
                          ),
                        ),
                      ),
                    )
                  
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(
                        index: index,
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          return Container(
                            color: Colors.white,
                            child: Text(
                              state.homedata[index].category,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TitleWidget extends StatelessWidget {
  final int index;
  const TitleWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        String title = "title";
        if (state.homedata[index].title.length > 20) {
          title = state.homedata[index].title.substring(0, 21) + "...";
        } else {
          title = state.homedata[index].title;
        }
        return Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}

class Topbar extends StatelessWidget {
  const Topbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 165, 93, 117),
      width: double.infinity,
      height: 60,
      child: const Padding(
        padding: EdgeInsets.only(top: 10, left: 5),
        child: Text(
          'Meals',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
