import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="services-form"
export default class extends Controller {
  static targets = ["amountField", "priceField", "totalField"];

  updateTotal() {
    const totalCost = this.amount() * this.price();
    console.log(this.amount(), this.amount() * this.price());
    this.totalFieldTarget.value = Number(totalCost.toFixed(2));
  }

  price() {
    return parseFloat(this.priceFieldTarget.value || 0);
  }

  amount() {
    return parseFloat(this.amountFieldTarget.value || 0);
  }

  total() {
    return parseFloat(this.totalFieldTarget.value);
  }
}
