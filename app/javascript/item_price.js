window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(addTaxDom);

    const calProfit = document.getElementById("profit");
      const valueResult = inputValue * 0.1
      console.log(valueResult);
      calProfit.innerHTML = (Math.floor(inputValue - valueResult));
      console.log(calProfit)
  })
});