module Page.Home exposing (..)

import Session exposing (Session)
import Model exposing (Model)

init : Session -> (Model, Cmd msg)
init session = (initModel session, Cmd.none)

initModel : Session -> Model
initModel session = Model.Home {session = session}
