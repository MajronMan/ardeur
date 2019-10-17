module Page.Article.View exposing (view)

import Dict
import Html
import Html.Attributes as Attr
import Html.Styled exposing (..)
import Markdown
import Page.Article.Header exposing (articleHeader, listHeader)
import Page.Article.Model exposing (Model(..))
import Page.Article.Update exposing (Msg(..))
import Page.Components.Spinner exposing (spinner, spinnerUnstyled)
import Page.Components.VaporButton exposing (vaporButton)
import Router.Routes as Routes
import Styles.Pages.Article as Style
import Utils.Markdown


view : Model -> Html.Html Msg
view (Article { name, texts, list }) =
    if name == "" then
        renderList list |> toUnstyled

    else
        renderSingle (Dict.get name texts) |> toUnstyled


renderList : List String -> Html Msg
renderList list =
    let
        content =
            if List.isEmpty list then
                styled div Style.listSpinner [] [ spinner ]

            else
                styled div Style.listButtons [] <| List.map (\name -> vaporButton Style.button (ChangeRoute (Routes.Article name)) name) list
    in
    styled div Style.list [] [ listHeader, content ]


renderSingle : Maybe String -> Html Msg
renderSingle t =
    let
        content =
            case t of
                Nothing ->
                    [ spinner ]

                Just text ->
                    [ fromUnstyled <| Utils.Markdown.view text ]

        --Markdown.toHtml Nothing text
    in
    styled div
        Style.article
        []
        [ articleHeader
        , styled p
            Style.articleText
            []
            content
        ]
