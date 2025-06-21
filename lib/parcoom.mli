type input =
  { text : string
  ; pos : int
  }

val input_sub : int -> int -> input -> input
val make_input : string -> input

type error =
  { desc : string
  ; pos : int
  }

type 'a parser = { run : input -> input * ('a, string) result }

val fail : string -> 'a parser
val wrap : 'a -> 'a parser
val map : ('a -> 'b) -> 'a parser -> 'b parser
val bind : ('a -> 'b parser) -> 'a parser -> 'b parser
val parse_while : (char -> bool) -> string parser
val prefix : string -> string parser
val ( *> ) : 'a parser -> 'b parser -> 'b parser
val ( <* ) : 'a parser -> 'b parser -> 'a parser
val ( <*> ) : 'a parser -> 'b parser -> ('a * 'b) parser
val ( <|> ) : 'a parser -> 'a parser -> 'a parser
val optional : 'a parser -> 'a option parser
val many_exact : int -> 'a parser -> 'a list parser
val many : 'a parser -> 'a list parser
val any_char : char parser
val run : 'a parser -> string -> ('a, error) result
