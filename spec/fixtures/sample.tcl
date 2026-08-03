# Assertions live in the comments: `<- scope` checks the marker's own column
# on the previous non-comment line, `^ scope` checks the caret's. Scopes
# match by prefix, so the trailing `.tcl` segment is left off.

proc greet {name} {
# <- keyword
#          ^ punctuation.definition.block.begin.bracket.curly

    puts "hello"
#         ^ string

    set n [llength $argv]
#         ^ punctuation.definition.command-substitution.begin.bracket.square
#                       ^ punctuation.definition.command-substitution.end.bracket.square

}
# <- punctuation.definition.block.end.bracket.curly

# a comment
# <- comment
