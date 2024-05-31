function calculatePrice() {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    // 販売手数料を計算（10%）
    const fee = Math.floor(inputValue * 0.1);
    console.log(fee);

    // 利益を計算（価格から手数料を引いたもの）
    const profit = Math.floor(inputValue - fee);
    console.log(profit);

    // HTMLに表示
    addTaxDom.innerHTML = fee;
    profitDom.innerHTML = profit;
  });
}

// Turboがロードされたときに関数を実行
document.addEventListener('turbo:load', calculatePrice);
// 通常のページロード時にも関数を実行
document.addEventListener('DOMContentLoaded', calculatePrice);
document.addEventListener('turbo:render', () => {
  calculatePrice(); // Turboがレンダリングした際に関数を実行
});