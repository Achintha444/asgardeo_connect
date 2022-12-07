import "package:flutter/material.dart";

double getMediaQueryHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getMediaQueryWidth(context) {
  return MediaQuery.of(context).size.width;
}
