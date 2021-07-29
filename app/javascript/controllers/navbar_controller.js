import { Controller } from "stimulus";

export default class extends Controller {
  static classes = ["waterfall"];

  waterfall() {
    if (window.scrollY > 0) {
      this.element.classList.add(this.waterfallClass);
    } else {
      this.element.classList.remove(this.waterfallClass);
    }
  }
}
