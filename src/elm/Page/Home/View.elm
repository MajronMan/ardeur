module Page.Home.View exposing (view)

import Asset
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)
import Page.Components.Jumbotron exposing (jumbotron)
import Page.Home.Model exposing (Model)
import Page.Home.Parts exposing (..)
import Page.Home.Update exposing (Msg(..))
import Ports
import Router.Routes exposing (Route(..))
import Styles.Home as Style


view : Model -> Html.Html Msg
view model =
    styled div
        Style.mainContainer
        []
        [ jumbotron
        , styled div
            Style.home
            []
            [ styled div
                Style.container
                []
                [ left, triangle, right ]
            , bottom
            ]
        ]
        |> toUnstyled
