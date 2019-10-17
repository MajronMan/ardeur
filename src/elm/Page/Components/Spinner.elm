module Page.Components.Spinner exposing (spinner, spinnerUnstyled)

import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (class, css, href, src)
import Html.Styled.Events exposing (onClick)
import Styles.Components.Spinner as Style


spinner : Html msg
spinner =
    styled div
        Style.wrapper
        []
        [ styled i Style.inner [ class "fas fa-yin-yang" ] [] ]


spinnerUnstyled : Html.Html msg
spinnerUnstyled =
    spinner |> toUnstyled
