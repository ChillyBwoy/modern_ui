"use strict";
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/hooks/index.ts
var hooks_exports = {};
__export(hooks_exports, {
  CharacterCounter: () => CharacterCounter,
  ModalDialog: () => ModalDialog,
  SmoothScroll: () => SmoothScroll
});
module.exports = __toCommonJS(hooks_exports);

// src/hooks/SmoothScroll.ts
var SmoothScroll = {
  updated() {
    const children = Array.from(this.el.children);
    const active = children.find((el) => el.dataset.active != null);
    if (active != null) {
      active.scrollIntoView({
        behavior: "smooth",
        block: "center",
        inline: "center"
      });
    }
  }
};

// src/hooks/CharacterCounter.ts
var SELECTOR = {
  input: "[data-type='CharacterCounter.input']",
  counter: "[data-type='CharacterCounter.counter']"
};
var ATTRS = {
  maxLengthVal: "data-max-length"
};
var CLASSES = {
  ok: "text-secondary",
  warning: "text-warning",
  danger: "text-danger"
};
var THRESHOLD = [
  [90, CLASSES.danger],
  [75, CLASSES.warning],
  [-1, CLASSES.ok]
];
var toggleClasses = (el, value) => {
  for (const cl of Object.values(CLASSES)) {
    el.classList.remove(cl);
  }
  for (const [threshold, className] of THRESHOLD) {
    if (value >= threshold) {
      el.classList.add(className);
      break;
    }
  }
};
var updateCounter = (el) => {
  const $input = el.querySelector(SELECTOR.input);
  const $counter = el.querySelector(SELECTOR.counter);
  if ($input == null || $counter == null) {
    return;
  }
  const maxLength = parseInt(el.getAttribute(ATTRS.maxLengthVal) || "0", 10);
  if (maxLength <= 0) {
    return;
  }
  const currentLength = $input.value.length;
  $counter.textContent = currentLength.toString();
  toggleClasses($counter, currentLength / maxLength * 100);
};
var CharacterCounter = {
  mounted() {
    updateCounter(this.el);
    const update = () => {
      updateCounter(this.el);
    };
    this.el.addEventListener("input", update);
    this.el.addEventListener("keyup", update);
    this.el.addEventListener("paste", () => {
      setTimeout(update, 100);
    });
  },
  updated() {
    updateCounter(this.el);
  }
};

// src/hooks/ModalDialog.ts
var SELECTOR2 = {
  close: "[data-type='ModalDialog.close']"
};
var ATTRS2 = {
  onCancel: "data-dialog-on-cancel"
};
var ModalDialog = {
  mounted() {
    const $dialog = this.el;
    const $close = $dialog.querySelector(SELECTOR2.close);
    $close.addEventListener("click", () => {
      $dialog.close();
    });
    $dialog.addEventListener("close", () => {
      const onCancel = $dialog.getAttribute(ATTRS2.onCancel);
      if (onCancel != null) {
        this.liveSocket.execJS(this.el, onCancel);
      }
    });
    $dialog.showModal();
  },
  updated() {
    const $dialog = this.el;
    $dialog.showModal();
  }
};
//# sourceMappingURL=modern_ui.cjs.map
