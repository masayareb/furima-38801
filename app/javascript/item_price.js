window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const Tax = Math.floor(inputValue / 10);
    addTaxDom.innerHTML = Tax

    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - Tax);
 })
});