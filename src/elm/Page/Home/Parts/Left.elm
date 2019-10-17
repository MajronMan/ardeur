module Page.Home.Parts.Left exposing (left)

import Html.Styled exposing (..)
import Page.Components.VaporButton exposing (vaporButton)
import Page.Home.Update exposing (Msg(..))
import Router.Routes exposing (Route(..))
import Styles.Home as Style


left =
    styled div Style.left [] [ vaporButton Style.leftButton (ChangeRoute Poetry) "Poetry" ]
