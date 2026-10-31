describe("language-tcl editing defaults", () => {
  let editor;
  beforeEach(async () => {
    jasmine.useRealClock();
    await lumine.packages.activatePackage("language-source");
    await lumine.packages.activatePackage("language-tcl");
    await lumine.packages.activatePackage("bracket-matcher");
    editor = await lumine.workspace.open();
    editor.setGrammar(lumine.grammars.grammarForScopeName("source.tcl"));
    editor.setText("set value 1");
    await editor.whenGrammarSettled();
  });
  afterEach(() => editor?.destroy());

  it("does not insert a second apostrophe for an operator or unpaired token", async () => {
    editor.setText("set value ");
    await editor.whenGrammarSettled();
    editor.setCursorBufferPosition([0, Infinity]);
    await editor.insertText("'");
    await editor.whenGrammarSettled();
    expect(editor.getText()).toBe("set value '");
  });
  it("still pairs a clear opening parenthesis and honors user quote pairs", async () => {
    editor.setText("");
    await editor.whenGrammarSettled();
    await editor.insertText("(");
    await editor.whenGrammarSettled();
    expect(editor.getText()).toBe("()");
    const options = { scopeSelector: ".source.tcl" };
    try {
      lumine.config.set("bracket-matcher.autocompleteCharacters", ["''"], options);
      lumine.config.set("bracket-matcher.autocompleteDisabledCharacters", [], options);
      editor.setText("");
      await editor.whenGrammarSettled();
      editor.setCursorBufferPosition([0, 0]);
      await editor.insertText("'");
      await editor.whenGrammarSettled();
      expect(editor.getText()).toBe("''");
    } finally {
      lumine.config.unset("bracket-matcher.autocompleteCharacters", options);
      lumine.config.unset("bracket-matcher.autocompleteDisabledCharacters", options);
    }
  });
});
