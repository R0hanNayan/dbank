import Debug "mo:base/Debug";

actor DBank{
  var currentValue = 300;
  currentValue := 100;  //To change value in a variable

  let id = 123211244; //Does not allow to change data -> constant -> immutable

  Debug.print(debug_show(currentValue));  //To Print a value from variable
  Debug.print(debug_show(id)); 
}