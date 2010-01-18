(*
 * text_pcre.ml
 * ------------
 * Copyright : (c) 2010, Jeremie Dimino <jeremie@dimino.org>
 * Licence   : BSD3
 *
 * This file is a part of ocaml-text.
 *)

let iflags = Pcre.cflags [`UTF8; `ANCHORED; `DOLLAR_ENDONLY]

let regexp str = Pcre.regexp ~iflags str

let exec store array =
  try
    store := Array.map (fun (regexp, text) -> Pcre.exec ~rex:(Lazy.force regexp) text) array;
    true
  with Not_found ->
    false