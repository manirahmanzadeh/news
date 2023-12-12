import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/discover_bloc.dart';
import '../bloc/discover_event.dart';

class DiscoverNews extends StatelessWidget {
  const DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 5),
          Text(
            'News from all over the world',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          TextFormField(
            onChanged: (value) {
              BlocProvider.of<DiscoverBloc>(context).add(ChangeQDiscoverEvent(q: value));
            },
            controller: BlocProvider.of<DiscoverBloc>(context).searchTextField,
            decoration: InputDecoration(
              hintText: 'Search',
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.tune,
                  color: Colors.grey,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
