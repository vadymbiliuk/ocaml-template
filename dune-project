(lang dune 3.15)

(name template)

(generate_opam_files true)

(source
 (github vadymbiliuk/template))

(authors "Vadym Biliuk <vadym.biliuk@gmail.com>")

(maintainers "Vadym Biliuk <vadym.biliuk@gmail.com>")

(license LICENSE)

(package
 (name template)
 (synopsis "Template project")
 (description "Template project with nix/ocaml support")
 (depends
  ocaml
  dune
  base
  dotenv
  ppx_jane
  lwt
  yojson
  logs
  validate
  ppx_deriving)
 (tags
  ("Template" "Nix" "OCaml")))
