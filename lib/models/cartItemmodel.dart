class CartitemModel{

  static const DATE = 'date';
  static const GUESTS = 'guests';
  static const BIKEMODEL = 'bikemodel';
  static const PRICE = 'price';


  DateTime _date;
  int _guests;
  String _bikemodel;
  int _price;

  String get bikemodel=> _bikemodel;
  int get guests =>_guests;
  int  get price=> _price;
  DateTime get date => _date;


  CartitemModel.fromMap(Map data){

    _date = data[DATE];
    _guests = data[GUESTS];
    _bikemodel= data[BIKEMODEL];
    _price = data[PRICE];




  }

  Map toMap()=>{

    DATE : _date,
    GUESTS : _guests,
    BIKEMODEL: _bikemodel,
    PRICE : _price


  };





}