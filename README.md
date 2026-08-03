# language-tcl

Tcl language support.

## Features

- **Grammars**: provides Tree-sitter grammars, built from [tree-sitter-tcl](https://github.com/tree-sitter-grammars/tree-sitter-tcl).
- **Syntax highlighting**: commands, procedures, variables and both substitution forms.
- **Substitution**: `[ ]` command substitution is scoped apart from brace quoting, which suppresses it.
- **Folding**: folds procedure bodies.

## Services

- **hyperlink.injection** (`^1.0.0`): consumed to highlight URLs in these files as clickable links.
- **todo.injection** (`^1.0.0`): consumed to highlight `TODO`-style markers inside comments.

## Contributing

Got ideas to make this package better, found a bug, or want to help add new features? Just drop your thoughts on GitHub. Any feedback is welcome!
