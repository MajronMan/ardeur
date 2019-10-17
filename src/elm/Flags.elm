module Flags exposing (Flags, decodeFlags)


type alias Flags =
    ()


decodeFlags : String -> Result String Flags
decodeFlags _ =
    Err "No flags expected"
