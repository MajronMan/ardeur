module Page.Home.Parts.Bottom exposing (bottom)

import Html.Styled exposing (..)
import Html.Styled.Events exposing (..)
import Page.Components.VaporButton exposing (vaporButton)
import Page.Home.Update exposing (Msg(..))
import Router.Routes exposing (Route(..))
import Styles.Home as Style


bottom =
    styled div Style.bottom [] [ vaporButton Style.bottomButton (ChangeRoute ArticleList) "Articles" ]
