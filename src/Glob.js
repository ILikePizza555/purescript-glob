"use strict";

exports.globImpl = function(pattern, options, onError, onSuccess) {
    return () => require("glob")(pattern, options, (error, matches) => {
        if (error) onError(error)();
        else onSuccess(matches)();
    });
}