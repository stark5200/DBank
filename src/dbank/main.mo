import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;

  let id = 23546846415;

  Debug.print(debug_show(currentValue));
}
