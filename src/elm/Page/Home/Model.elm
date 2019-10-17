module Page.Home.Model exposing (Model, toSession)

import Session exposing (Session)


type alias Model =
    { session : Session }


toSession : Model -> Session
toSession { session } =
    session
