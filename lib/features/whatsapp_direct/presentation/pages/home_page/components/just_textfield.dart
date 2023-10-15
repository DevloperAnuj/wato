import 'package:flutter/material.dart';

class JustTextField extends StatelessWidget {
  const JustTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
      child: TextField(
        onChanged: (text) {},
        style: const TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        minLines: 1,
        maxLines: 3,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Your Message',
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.only(
            left: 14.0,
            bottom: 6.0,
            top: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class LinkTextField extends StatelessWidget {
  const LinkTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
      child: TextField(
        onChanged: (text) {},
        style: const TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        maxLines: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Link Text',
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.only(
            left: 14.0,
            bottom: 6.0,
            top: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
