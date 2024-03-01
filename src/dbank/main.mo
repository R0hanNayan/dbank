import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentValue: Float = 0; //Persisted Variable -> stable Keyword
  // currentValue := 100;  //To change value in a variable

  stable var startTime = Time.now();
  // Debug.print(debug_show(startTime));

  //let id = 123211244; //Does not allow to change data -> constant -> immutable

  //Debug.print(debug_show(currentValue));  //To Print a value from variable
  // Debug.print(debug_show(id)); 

  //Defining A Function:
  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    let diff: Float = currentValue - amount;

    if(diff >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Insufficient Balance");
    }
  };

  public query func checkBalance() : async Float{
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
}

