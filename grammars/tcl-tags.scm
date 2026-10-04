(procedure name: [(simple_word) (braced_word) (quoted_word)] @name
  (#set! symbol.strip "^[{\" ]|[}\" ]$")) @definition.function
((namespace (word_list . (simple_word) @_operation . [(simple_word) (braced_word) (quoted_word)] @name
  (#set! symbol.strip "^[{\" ]|[}\" ]$"))) @definition.module
  (#eq? @_operation "eval"))
