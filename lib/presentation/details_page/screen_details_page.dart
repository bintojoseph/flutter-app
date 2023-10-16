import 'package:auto_route/annotations.dart';
import 'package:exercise_app/application/details/details_bloc.dart';
import 'package:exercise_app/presentation/home_page/screen_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ScreenDetailsPage extends StatelessWidget {
  final String id;
  const ScreenDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int dishId = int.parse(id);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<DetailsBloc>(context)
          .add(DetailsEvent.getDetails(id: dishId));
    });
    return Container(
      color: Color.fromARGB(255, 165, 93, 117),
      child: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          return ListView(
            children:[ Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          state.details[0].imgUrl,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  state.details[0].title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                //const TitleWidget(),
                const DetailsContentWidget(),
              ],
            ),
            ]
          );
        },
      ),
    );
  }
}

class DetailsContentWidget extends StatelessWidget {
  const DetailsContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.yellow,
        ),
        width: double.infinity,
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<DetailsBloc, DetailsState>(
            builder: (context, state) {
              return Column(
                children: [
                  const Text(
                    "Recipe",
                    style: TextStyle(color: Colors.black, fontSize: 26),
                  ),
                  Text(state.details[0].recipe, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
