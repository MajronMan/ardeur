module Page.Components.Jumbotron exposing (jumbotron)

import Html
import Html.Attributes as Attr
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Styles.Jumbotron as Style


jumbotron : Html msg
jumbotron =
    styled div
        Style.jumbotron
        []
        [ styled div Style.mainText [] [ text "Caution: edgy content ahead" ]
        , styled div
            Style.mainTextOverlayBox
            []
            [ styled div Style.mainTextOverlay [] [ text "Caution: edgy content ahead" ] ]
        ]
