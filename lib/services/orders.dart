import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/cartItemmodel.dart';

class OrderService{


  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String collections = "orders";


  void createOrder(
      {Map cart }){



    firestore.collection(collections).doc().set({"cart":cart,});}}