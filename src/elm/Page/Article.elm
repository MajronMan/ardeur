module Page.Article exposing (init, initModel, reuseModel)

import Dict
import Html exposing (..)
import Model exposing (Model)
import Page.Article.Model as PageModel
import Ports
import Session exposing (Session)


init : Session -> String -> ( Model, Cmd msg )
init session name =
    ( initModel session name
    , getCmd name [] Dict.empty
    )


getCmd name list texts =
    let
        text =
            Dict.get name texts
    in
    case ( name, list, text ) of
        ( "", [], _ ) ->
            Ports.listArticles ()

        ( "", _, _ ) ->
            Cmd.none

        ( _, _, Nothing ) ->
            Ports.getArticle name

        _ ->
            Cmd.none


initModel session name =
    Model.Article
        (PageModel.Article
            { session = session
            , texts = Dict.empty
            , name = name
            , list = []
            }
        )


reuseModel : PageModel.Model -> Session -> String -> ( Model, Cmd msg )
reuseModel (PageModel.Article model) session name =
    ( Model.Article <| PageModel.Article { model | session = session, name = name }
    , getCmd name model.list model.texts
    )
