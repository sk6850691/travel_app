import 'package:travel_app/models/cartItemmodel.dart';

class UserModel{


  List <CartitemModel> cart;
  
  
  List<CartitemModel> _convertedCartItems(List cart){
    List<CartitemModel> convertedCart = [];
    
    for (Map cartItem in cart){
      convertedCart.add(CartitemModel.fromMap(cartItem));
    }
    return convertedCart;
    
    
  }
  
  
}