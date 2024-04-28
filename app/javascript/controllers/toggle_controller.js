import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static classes = [ 'show' ]
  display_menu() {
    this.element.classList.add(this.showClass)
  }
}
