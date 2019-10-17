module Styles.Components.Spinner exposing (inner, wrapper)

import Css exposing (..)
import Css.Animations as Animations
import Css.Transitions exposing (linear, transition)
import Styles.Colours exposing (..)
import Styles.Helpers


frames =
    Animations.keyframes
        [ ( 0, [ Animations.transform [ rotate (deg 0) ] ] )
        , ( 100, [ Animations.transform [ rotate (deg 360) ] ] )
        ]


wrapper : List Style
wrapper =
    [ width (pct 100)
    , height (pct 100)
    , displayFlex
    , justifyContent center
    , alignItems center
    ]


inner : List Style
inner =
    [ fontSize (px 200)
    , animationName frames
    , animationDuration (ms 2000)
    , animationIterationCount Styles.Helpers.infinite
    , property "animation-timing-function" "linear"
    ]
