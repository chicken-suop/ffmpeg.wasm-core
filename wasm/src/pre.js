// Disable process.exit in nodejs and don't call onExit twice.
Module['quit'] = function(status) {
  if (Module["onExit"]) Module["onExit"](status);
  throw new ExitStatus(status);
}

Module['exit'] = exit;

/**
 * Disable all console output, might need to enable it
 * for debugging
 */
// out = err = function() {}
