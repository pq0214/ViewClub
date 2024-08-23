// import 'package:clubproject/Component/clubTile_title.dart';
// import 'package:clubproject/models/club.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FavouritePage extends StatefulWidget {
//   const FavouritePage({super.key});

//   @override
//   State<FavouritePage> createState() => _FavouritePageState();
// }

// class _FavouritePageState extends State<FavouritePage> {
//   //remove from favourite
//   void removeFromFavourite(Club_display club) {
//     Provider.of<Club>(context, listen: false).removeClub(club);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Club>(
//       builder: (context, value, child) => SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(25.0),
//           child: Column(
//             children: [
//               //heading
//               Text(
//                 "Your favourite is empty",
//                 style: TextStyle(fontSize: 20),
//               ),
//               //list of cart
//               Expanded(
//                 child: ListView.builder(
//                     itemCount: value.userCart.length,
//                     itemBuilder: (context, index) {
//                       //get individual cart item
//                       Club_display eachClub = value.userCart[index];
//                       //return coffee tile
//                       return ClubTile(
//                         club: eachClub,
//                         onPressed: () => removeFromFavourite(eachClub),
//                         icon: Icon(Icons.delete),
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
