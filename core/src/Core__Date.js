

import * as Core__Float from "./Core__Float.js";

let UTC = {};

function equal(a, b) {
  return a.getTime() === b.getTime();
}

function compare(a, b) {
  return Core__Float.compare(a.getTime(), b.getTime());
}

export {
  UTC,
  equal,
  compare,
}
/* No side effect */
