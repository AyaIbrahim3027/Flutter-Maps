import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/colors.dart';
import 'package:flutter_maps/data/models/place_suggestion.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({super.key, required this.suggestion});

  final PlaceSuggestionModel suggestion;

  @override
  Widget build(BuildContext context) {
    var subTilte = suggestion.description
        .replaceAll(suggestion.description.split(',')[0], '');

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 40,height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.lightBlue,
              ),
              child: Icon(Icons.place,color: MyColors.blue,),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${suggestion.description.split(',')[0]}\n',
                    style: TextStyle(color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextSpan(
                    text: subTilte.substring(2),
                    style: TextStyle(color: Colors.black,
                      fontSize: 16,),
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}
