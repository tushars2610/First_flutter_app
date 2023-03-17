import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: AppStyle.cardsColor[doc['color_id']].withOpacity(0.2),
          borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            style: AppStyle.mainTitle,
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            doc["creation_date"],
            style: AppStyle.dateTitle,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            doc["note_content"],
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                await FirebaseFirestore.instance
                    .collection("notes")
                    .doc(doc.id)
                    .delete();
              },
            ),
          ),
        ],
      ),
    ),
  );
}
