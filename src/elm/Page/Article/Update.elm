module Page.Article.Update exposing (Msg(..), update)

import Browser.Navigation as Nav
import Dict
import Page.Article.Model as PageModel exposing (Model)
import Ports
import Router.Routes exposing (Route(..))
import Session exposing (Session, getKey)
import Signal exposing (Signal(..))


type Msg
    = GotSession Session
    | ArticleLoaded String
    | ArticlesListed (List String)
    | ChangeRoute Route


update : Msg -> Model -> ( Model, Cmd Msg, Signal )
update msg (PageModel.Article m) =
    case msg of
        ArticleLoaded text ->
            ( PageModel.Article { m | texts = Dict.insert m.name text m.texts }, Cmd.none, NoSignal )

        ArticlesListed list ->
            ( PageModel.Article { m | list = list }, Cmd.none, NoSignal )

        ChangeRoute targetRoute ->
            ( PageModel.Article m, Cmd.none, RequestRouteChange targetRoute )

        _ ->
            ( PageModel.Article m, Cmd.none, NoSignal )
