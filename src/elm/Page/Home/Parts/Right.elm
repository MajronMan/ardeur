module Page.Home.Parts.Right exposing (right)

import Html.Styled exposing (..)
import Page.Components.VaporButton exposing (vaporButton)
import Page.Home.Update exposing (Msg(..))
import Router.Routes exposing (Route(..))
import Styles.Home as Style


right =
    styled div Style.right [] [ vaporButton Style.rightButton (ChangeRoute Programming) "Programming" ]
