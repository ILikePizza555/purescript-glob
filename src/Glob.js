"use strict";

exports.globImpl = function(patterns, options, onError, onSuccess) {
    return () => require("glob")(patterns, options, (error, matches) => {
        if (error) onError(error)();
        else onSuccess(matches)();
    });
}