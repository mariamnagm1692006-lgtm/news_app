import 'package:flutter/material.dart';
import 'package:news_app/features/home/view_model/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/view_model/home_state.dart';

import '../widget/image_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String ?messageError;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
        create: (context) => HomeCubit()..fetchNews(),
        child: Scaffold(
          backgroundColor: Color(0xff202020),
          appBar: AppBar(
            backgroundColor: Color(0xff1877F2),
            title: Text(
              'News App',
              style: TextStyle(
                color: Colors.white,
                fontWeight: .bold,
                fontSize: 30,
              ),
            ),
            centerTitle: true,
          ),
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              switch(state) {
                case HomeInitial():
                       return Center(child: SizedBox.shrink());
                case HomeLoading():
                  return Center(child: CircularProgressIndicator(),);
                case HomeSuccess():
                return ListView.builder(
                  itemCount: state.articles.length,
                  itemBuilder: (context, index) {
                    return ImageItemWidget(
                      image: state.articles[index].urlToImage??dummyImage,
                      title: state.articles[index].title?? 'No Title Available',
                      onTap: () {},
                    );
                  },
                );

                case HomeError():
                  return Center(child: Text(state.messageError),);
              }


            },
          ),

        )
    );
  }
}


String dummyImage =
    'https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip';
