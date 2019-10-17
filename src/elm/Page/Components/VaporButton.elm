module Page.Components.VaporButton exposing (vaporButton, vaporButtonUnstyled)

import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Styles.Components.VaporButton as Style
import Css exposing (Style)


vaporButton : List Style -> msg -> String -> Html msg
vaporButton styles msg content =
    styled button (Style.vaporButton ++ styles) [ onClick msg ] [ text content ]


vaporButtonUnstyled : List Style -> msg -> String -> Html.Html msg
vaporButtonUnstyled s m c =
    vaporButton s m c |> toUnstyled
