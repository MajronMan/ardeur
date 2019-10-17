module Page.Home.Update exposing (Msg(..), update)

import Page.Home.Model exposing (Model)
import Ports
import Router.Routes exposing (Route(..))
import Session exposing (Session)
import Signal exposing (Signal(..))


type Msg
    = GotSession Session
    | ChangeRoute Route


update : Msg -> Model -> ( Model, Cmd Msg, Signal )
update msg model =
    case msg of
        ChangeRoute targetRoute ->
            ( model, Cmd.none, RequestRouteChange targetRoute )

        _ ->
            ( model, Cmd.none, NoSignal )
