import 'package:flutter/material.dart';

@immutable
abstract class LocationEvent {}

class InitialLocationEvent extends LocationEvent {}
