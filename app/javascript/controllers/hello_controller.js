import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "button" ]
  connect() {
    this.element.textContent = "Hello World!"
  }

  changeClass(event){
      const button = this.buttonTarget
      console.log(event.target)
  }
}
