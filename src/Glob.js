"use strict";

exports.globImpl = function(pattern, options) {
    return () => (onError, onSuccess) => require("glob")(pattern, options, (error, matches) => {
        if (error) { onError(error); }
        else { onSuccess(matches); }
    });
}