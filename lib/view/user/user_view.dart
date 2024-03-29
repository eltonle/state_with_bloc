import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_with_bloc/cubit/user_cubit.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  void initState() {
    context.read<UserCubit>().userLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users Items',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is UserLoadedState) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              itemCount: state.userObj.users?.length ?? 0,
              itemBuilder: (context, index) {
                var userObj = state.userObj.users?[index];
                return userObj != null
                    ? Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 2)
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: userObj.image ?? "",
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                width: 70,
                                height: 70,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${userObj.firstName} ${userObj.lastName}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " ${userObj.email}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Container();
              },
            );
          } else if (state is UserErrorState) {
            return Center(
              child: Text(state.errorMsg),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class $ {}
