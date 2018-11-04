// src/controllers/hello_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]

  greet() {
    console.log(`Hello, ${this.name}!`)

    this.outputTarget.textContent =
      `Hello, ${this.name}!`
  }

  get name() {
    return this.nameTarget.value
  }
}
