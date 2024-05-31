function calculatePrice() {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const fee = Math.floor(inputValue * 0.1);
    console.log(fee);
    const profit = Math.floor(inputValue - fee);
    console.log(profit);
    addTaxDom.innerHTML = fee;
    profitDom.innerHTML = profit;
  });
}


document.addEventListener('turbo:load', calculatePrice);
document.addEventListener('DOMContentLoaded', calculatePrice);
document.addEventListener('turbo:render', () => {
  calculatePrice(); 
});