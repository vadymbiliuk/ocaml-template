type t =
  { discord_token : string
  ; database_url : string
  ; log_level : string
  }

val load : unit -> (t, string) result
