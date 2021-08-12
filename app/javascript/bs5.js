import * as bootstrap from "bootstrap";

function popoverify() {
  new bootstrap.Popover(document.body, {
    selector: '[data-bs-toggle="popover"]',
    container: "body",
    trigger: "focus",
  });
}

function tooltipify() {
  new bootstrap.Tooltip(document.body, {
    selector: '[data-bs-toggle="tooltip"]',
    container: "body",
  });
}

// function offcanvasify() {
//   document
//     .querySelectorAll('[data-bs-toggle="offcanvas"]')
//     .forEach(function (offcanvasTriggerEl) {
//       new bootstrap.Offcanvas(offcanvasTriggerEl);
//     });
// }

export function start() {
  popoverify();
  tooltipify();
}
