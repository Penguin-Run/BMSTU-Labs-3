function clickOnPlus(e) {
  let row = this.parentElement.children

  let cartTable = document.getElementById('cartTable')
  let newRow = cartTable.insertRow(cartTable.children.length+1)
  let cellName = newRow.insertCell(0);
  let cellPrice = newRow.insertCell(1);

  for (let i = 0; i < row.length-1; i++) {
    console.log(row[i].textContent)
  }

  cellName.innerHTML = row[0].textContent
  cellPrice.innerHTML = row[1].textContent

  priceCalc()
}

function priceCalc() {
  let cartTable = document.getElementById('cartTable')
  let a = 0;
  for (let i = 2; i < cartTable.rows.length-1; i++) {
    let text = cartTable.rows[i].children[1].textContent
    a += parseInt(text, 10)
  }
  cartTable.rows[cartTable.rows.length-1].children[1].innerHTML = a
  console.log(a)
}

function addClickListenersToPluses() {
  document.getElementById('plus1').addEventListener("click", clickOnPlus, false)
  document.getElementById('plus2').addEventListener("click", clickOnPlus, false)
  document.getElementById('plus3').addEventListener("click", clickOnPlus, false)
}


function onAddButtonClick() {
  let name = document.getElementById('nameTextEdit').value
  let price = document.getElementById('priceTextEdit').value

  let table = document.getElementById('catalogTable')
  let newRow = table.insertRow()

  newRow.innerHTML =
  "<td>" + name +
  "</td><td>" + price +
  "</td><td>" + "+" + "</td>"

  newRow.children[2].addEventListener("click", clickOnPlus, false)
}
