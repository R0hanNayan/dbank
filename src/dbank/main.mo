import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DBank{
  stable var currentValue: Nat = 300; //Persisted Variable -> stable Keyword
  //currentValue := 100;  //To change value in a variable

  let id = 123211244; //Does not allow to change data -> constant -> immutable

  //Debug.print(debug_show(currentValue));  //To Print a value from variable
  // Debug.print(debug_show(id)); 

  //Defining A Function:
  public func topUp(amount: Nat){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat){
    let diff: Int = currentValue - amount;

    if(diff >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Insufficient Balance");
    }
  };

  public query func checkBalance() : async Nat{
    return currentValue;
  };
}

