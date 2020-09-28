function price(){
  const priceInput = document.getElementById("dance-price")
  const add_tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  priceInput.addEventListener('keyup', function(){
    const value = priceInput.value

    if (value >= 300 && value <= 9999999) {
      let fee = value * 0.1
      let gain = value - fee
      add_tax.textContent = fee
      profit.textContent = gain
    } else {
      let fee = "-"
      let gain = "-"
      add_tax.textContent = fee
      profit.textContent = gain
    }
  })

}
window.addEventListener('load', price)

