open Base

type t =
  { discord_token : string [@min_length 1]
  ; database_url : string [@min_length 1]
  ; log_level : string
  }
[@@deriving validate]

let get_required name =
  match Sys.getenv name with
  | Some v -> Ok v
  | None -> Error (Printf.sprintf "Missing required environment variable: %s" name)


let load _ =
  let open Result.Let_syntax in
  let%bind discord_token = get_required "DISCORD_TOKEN" in
  let%bind database_url = get_required "DATABASE_URL" in
  let%bind log_level = get_required "LOG_LEVEL" in
  return { discord_token; database_url; log_level }
