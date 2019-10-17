module Page.Lol exposing (..)

import Html exposing (..)
import Model

view : Html msg
view = div [] [ text "lol" ]

init session s = (Model.Lol (session, s), Cmd.none)
