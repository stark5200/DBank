import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Float "mo:base/Float";
import Time "mo:base/Time";

actor DBank {
  stable var currentValue: Float = 300;
  //currentValue := 100;

  let id = 23546846415;

  stable var startTime = Time.now();
  //startTime := Time.now();


  Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue +=amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let temp: Float = (currentValue - amount);
    if (temp >= 0) { 
    currentValue -=amount;
    Debug.print(debug_show(currentValue));
    } else {
    Debug.print("withdraw amount too great!");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  }; 

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS= timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.0001 ** Float.fromInt(timeElapsedS)); 
    startTime:= currentTime;
  };

  

  //topUp();
}
