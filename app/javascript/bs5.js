import * as bootstrap from "bootstrap";

function popoverify() {
  document
    .querySelectorAll('[data-bs-toggle="popover"]')
    .forEach(function (popoverTriggerEl) {
      new bootstrap.Popover(popoverTriggerEl);
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
