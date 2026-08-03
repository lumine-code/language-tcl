exports.activate = function () {};

exports.consumeHyperlinkInjection = (hyperlink) => {
  hyperlink.addInjectionPoint("source.tcl", {
    types: ["comment"],
  });
};

exports.consumeTodoInjection = (todo) => {
  todo.addInjectionPoint("source.tcl", {
    types: ["comment"],
  });
};
