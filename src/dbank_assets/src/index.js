import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async function() {
  //console.log("finished loading");
  update();
}) 

document.querySelector("form").addEventListener("submit", async function(event) {
  //console.log("button pressed");
  event.preventDefault();

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  if (document.getElementById("input-amount").value.length != 0) {
    await dbank.topUp(inputAmount);
    document.getElementById("input-amount").value = "";
  } 

  if (document.getElementById("withdrawal-amount").value.length != 0) {
    await dbank.withdraw(outputAmount);
    document.getElementById("withdrawal-amount").value = "";
  } 

  await dbank.compound();

  update();

  button.removeAttribute("disabled"); 
}) 

async function update() {
  const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText  = Math.round(currentAmount * 100) / 100;
}
