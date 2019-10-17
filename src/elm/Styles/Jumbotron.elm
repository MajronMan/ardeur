module Styles.Jumbotron exposing (jumbotron, mainText, mainTextOverlay, mainTextOverlayBox)

import Css exposing (..)
import Css.Animations as Animations
import Styles.Colours exposing (..)
import Styles.Helpers


jumbotron : List Style
jumbotron =
    [ width (vw 100), height (vh 25), color (hex "000000"), backgroundColor secondary, textAlign center, position relative, fontSize (rem 2) ]


mainText : List Style
mainText =
    [ position relative
    , top (px 0)
    , displayFlex
    , height (pct 100)
    , alignItems center
    , justifyContent center
    ]


overlayFrames =
    Animations.keyframes
        [ ( 0, [ Animations.opacity zero ] )
        , ( 10, [ Animations.opacity (int 1) ] )
        , ( 15, [ Animations.transform [ translate (px 5) ] ] )
        , ( 30, [ Animations.property "filter" "blur(3px)" ] )
        , ( 50, [ Animations.property "filter" "none" ] )
        , ( 55, [ Animations.property "filter" "invert(75%)" ] )
        , ( 60, [ Animations.transform [ translate (px -5) ] ] )
        , ( 70, [ Animations.property "filter" "hue-rotate(90deg)", Animations.transform [ scale 1.05 ] ] )
        , ( 80, [ Animations.transform [ translateY (px 5) ] ] )
        , ( 90, [ Animations.property "filter" "none", Animations.opacity (num 0.5) ] )
        , ( 100, [ Animations.opacity zero ] )
        ]


mainTextOverlayBox : List Style
mainTextOverlayBox =
    [ position absolute
    , left (pct 50)
    , top (pct 50)
    , height (pct 100)
    , width (pct 100)
    , displayFlex
    ]


mainTextOverlay : List Style
mainTextOverlay =
    [ position relative
    , top (pct -50)
    , left (pct -50)
    , flex (num 1)
    , width (pct 100)
    , color (hex "FA2222")
    , displayFlex
    , height (pct 100)
    , alignItems center
    , justifyContent center
    , opacity zero
    , hover
        [ animationName overlayFrames
        , animationDuration (ms 3000)
        , animationIterationCount Styles.Helpers.infinite
        ]
    ]
