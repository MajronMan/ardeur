module Styles.Components.VaporButton exposing (vaporButton)

import Css exposing (..)
import Css.Animations as Animations
import Css.Transitions exposing (ease, easeInOut, transition)
import Styles.Colours exposing (..)


vaporButton : List Style
vaporButton =
    [ position relative
    , display inlineBlock
    , border3 (px 2) solid white
    , borderRadius (px 8)
    , padding (px 4)
    , margin (px 4)
    , textDecoration none
    , backgroundColor black
    , color white
    , fontFamily inherit
    , cursor pointer
    , transition
        [ Css.Transitions.background3 300 0 ease
        , Css.Transitions.color3 300 0 ease
        , Css.Transitions.border3 300 0 ease
        , Css.Transitions.transform3 250 0 ease
        ]
    , hover
        [ backgroundColor white, color black, borderColor black ]
    , focus
        [ backgroundColor darkGrey
        , color white
        , borderColor white
        , outline zero
        ]
    , active [ borderColor (rgba 0 0 0 0) ]
    ]
