

import * as Caml_option from "rescript/lib/es6/caml_option.js";

function bind(x, f) {
  if (x == null) {
    return x;
  } else {
    return f(x);
  }
}

function iter(x, f) {
  if (!(x == null)) {
    return f(x);
  }
  
}

function fromOption(x) {
  if (x !== undefined) {
    return Caml_option.valFromOption(x);
  }
  
}

let from_opt = fromOption;

export {
  bind,
  iter,
  fromOption,
  from_opt,
}
/* No side effect */
