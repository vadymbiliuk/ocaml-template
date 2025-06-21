open Base

type t = { log_level : string } [@@deriving validate]

let get_required name =
  match Sys.getenv name with
  | Some v -> Ok v
  | None -> Error (Printf.sprintf "Missing required environment variable: %s" name)


let load _ =
  let open Result.Let_syntax in
  let%bind log_level = get_required "LOG_LEVEL" in
  return { log_level }
