module Styles.Home exposing (bottom, bottomButton, container, home, left, leftButton, mainContainer, right, rightButton)

import Css exposing (..)
import Css.Animations as Animations
import Styles.Colours exposing (..)


home : List Style
home =
    [ width (vw 100), height (vh 75), backgroundColor primary, fontSize (px 30) ]


mainContainer : List Style
mainContainer =
    [ maxWidth (vw 100)
    , overflow hidden
    ]


container : List Style
container =
    [ displayFlex, justifyContent spaceBetween, height (px 200) ]


bottom : List Style
bottom =
    [ displayFlex, justifyContent center ]


bottomButton : List Style
bottomButton =
    [ width (px 120) ]


left : List Style
left =
    [ width (vw 50), position relative ]


leftButton : List Style
leftButton =
    [ transform (rotate (deg -60))
    , position absolute
    , Css.right (px 35)
    , top (px 66)
    , zIndex (int 2)
    , width (px 120)
    ]


rightButton : List Style
rightButton =
    [ transform (rotate (deg 60))
    , position absolute
    , Css.left (px 35)
    , top (px 66)
    , zIndex (int 2)
    , width (px 120)
    ]


right : List Style
right =
    [ width (vw 50), position relative ]
