((comment) @_IGNORE_.spell @comment.line.tcl
  (#set! adjust.endBeforeFirstMatchOf "\\r?$"))

(command name: (simple_word) @entity.name.function.tcl)

"proc" @storage.type.function.tcl @keyword.control.tcl

(procedure
  name: (_) @variable.other.tcl
)

(set (id) @variable.other.tcl)

(argument
  name: (_) @variable.parameter.tcl @variable.other.tcl
)

((simple_word) @variable.language.tcl @variable.other.tcl
               (#any-of? @variable.language.tcl
                "argc"
                "argv"
                "argv0"
                "auto_path"
                "env"
                "errorCode"
                "errorInfo"
                "tcl_interactive"
                "tcl_library"
                "tcl_nonwordchars"
                "tcl_patchLevel"
                "tcl_pkgPath"
                "tcl_platform"
                "tcl_precision"
                "tcl_rcFileName"
                "tcl_traceCompile"
                "tcl_traceExec"
                "tcl_wordchars"
                "tcl_version"))

"expr" @support.function.builtin.tcl @entity.name.function.tcl

; Highlight switch arguments as string
(command
    name: (simple_word) @keyword.control.tcl
    arguments:
        (word_list
            (braced_word
                (command
                    name: (simple_word) @string.quoted.double.tcl)))
    (#eq? @keyword.control.tcl "switch"))

(command
  name: (simple_word) @support.function.builtin.tcl @entity.name.function.tcl
  (#any-of? @support.function.builtin.tcl
   "cd"
   "exec"
   "exit"
   "incr"
   "info"
   "join"
   "puts"
   "regexp"
   "regsub"
   "split"
   "subst"
   "trace"
   "source"))

; Highlight unset and variable arguments as variables
(command
    name: (simple_word) @keyword.control.tcl
    arguments: (word_list) @variable.other.tcl
    (#any-of? @keyword.control.tcl
        "unset"
        "variable"))

(command name: (simple_word) @keyword.control.tcl
         (#any-of? @keyword.control.tcl
          "append"
          "break"
          "catch"
          "continue"
          "default"
          "dict"
          "error"
          "eval"
          "global"
          "lappend"
          "lassign"
          "lindex"
          "linsert"
          "list"
          "llength"
          "lmap"
          "lrange"
          "lrepeat"
          "lreplace"
          "lreverse"
          "lsearch"
          "lset"
          "lsort"
          "package"
          "return"
          "trap"
          "throw"))

[
 "catch"
 "error"
 "global"
 "namespace"
 "on"
 "set"
 "try"
 "finally"
 ] @keyword.control.tcl

(unpack) @keyword.operator.tcl

[
 "while"
 "foreach"
 ; "for"
 ] @keyword.control.loop.tcl @keyword.control.tcl

[
 "if"
 "else"
 "elseif"
 ] @keyword.control.conditional.tcl @keyword.control.tcl

[
 "**"
 "/" "*" "%" "+" "-"
 "<<" ">>"
 ">" "<" ">=" "<="
 "==" "!="
 "eq" "ne"
 "in" "ni"
 "&"
 "^"
 "|"
 "&&"
 "||"
 ] @keyword.operator.tcl

(variable_substitution) @variable.other.tcl
(quoted_word) @string.quoted.double.tcl
(escaped_character) @constant.character.escape.tcl

; Braces quote a word literally; brackets substitute a command.
"{" @punctuation.definition.block.begin.bracket.curly.tcl
"}" @punctuation.definition.block.end.bracket.curly.tcl
"[" @punctuation.definition.command-substitution.begin.bracket.square.tcl
"]" @punctuation.definition.command-substitution.end.bracket.square.tcl
";" @punctuation.terminator.statement.tcl

(number) @constant.numeric.tcl

((simple_word) @constant.numeric.tcl
               (#match? @constant.numeric.tcl
                   "^[0-9]+$|^[+-]?[0-9]+$"))

((simple_word) @constant.language.boolean.tcl
               (#any-of? @constant.language.boolean.tcl "true" "false"))

; after apply array auto_execok auto_import auto_load auto_mkindex auto_qualify
; auto_reset bgerror binary chan clock close coroutine dde encoding eof fblocked
; fconfigure fcopy file fileevent filename flush format gets glob history http
; interp load mathfunc mathop memory msgcat my next nextto open parray pid
; pkg::create pkg_mkIndex platform platform::shell pwd re_syntax read refchan
; registry rename safe scan seek self socket source string tailcall tcl::prefix
; tcl_endOfWord tcl_findLibrary tcl_startOfNextWord tcl_startOfPreviousWord
; tcl_wordBreakAfter tcl_wordBreakBefore tcltest tell time timerate tm
; transchan unknown unload update uplevel upvar vwait yield yieldto zlib
