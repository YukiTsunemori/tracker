import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  open() {
    const modal = new bootstrap.Modal(this.modalTarget)
    modal.show()
  }

  close() {
    const modal = bootstrap.Modal.getInstance(this.modalTarget)
    modal.hide()
  }
}
