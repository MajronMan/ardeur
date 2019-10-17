module Page.Article.Header exposing (articleHeader, listHeader)

import Html
import Html.Attributes as Attr
import Html.Styled exposing (..)
import Html.Styled.Events exposing (onClick)
import Page.Article.Update exposing (Msg(..))
import Page.Components.VaporButton exposing (vaporButton)
import Router.Routes exposing (Route(..))
import Styles.Pages.Article as Style


articleHeader : Html Msg
articleHeader =
    styled div Style.articleHeader [] [ vaporButton [] (ChangeRoute ArticleList) "Back to list" ]


listHeader : Html Msg
listHeader =
    styled div Style.listHeader [] [ vaporButton [] (ChangeRoute Home) "Back to home" ]
