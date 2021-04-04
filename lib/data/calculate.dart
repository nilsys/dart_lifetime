import 'user_data.dart';

class Calculate {
  // ignore: unused_field
  Data _data;
  Calculate(this._data);

  double calculate() {
    double result;
    result = 90 + _data.sporDay - _data.smokingCigarette;
    result = result + (_data.peopleSize/_data.smokingCigarette);

    if(_data.onTapGender == 'KADIN') {return result + 3;}
    else {
      return result;
    }
   
  }
  

}
