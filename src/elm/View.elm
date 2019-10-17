module View exposing (view)

import Html exposing (Html)
import Model exposing (Model(..))
import Page
import Page.Article.Update as Article
import Page.Home.Update as Home
import Router
import Update exposing (Msg(..))


view : Model -> { title : String, body : List (Html Msg) }
view model =
    { title = Model.getTitle model
    , body = [ modelToBody model ]
    }


modelToBody : Model -> Html Msg
modelToBody model =
    case model of
        NotFound _ ->
            Page.notFound Ignored

        Home h ->
            Html.map HomeMsg (Page.home h)

        Lol _ ->
            Page.lol

        Article a ->
            Html.map ArticleMsg (Page.article a)
