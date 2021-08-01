import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    if (this.twttr) {
      this.twttr.widgets.load(this.element);
    }
  }

  get twttr() {
    return window.twttr;
  }
}
