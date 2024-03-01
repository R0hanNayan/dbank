import {dbank} from "../../declarations/dbank";

window.addEventListener("load", async function(){
  // console.log("Loaded");
 update();
});

document.querySelector("form").addEventListener("submit", async function(event){
  // console.log("Posted");
  event.preventDefault();
  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);  //to disable button till update

  //to prevent NaN
  if(document.getElementById("input-amount").value.length != 0){
    await dbank.topUp(inputAmount);
  }
  if(document.getElementById("withdrawal-amount").value.length != 0){
    await dbank.withdraw(outputAmount);
  }

  await dbank.compound();
  update();

  document.getElementById("input-amount").value = ""; //To set input to empty string
  document.getElementById("withdrawal-amount").value = ""; //To set input to empty string
  button.removeAttribute("disabled"); //to remove disabled attribute of button after update
});

async function update() {
  const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
};