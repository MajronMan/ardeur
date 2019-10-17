module Page.Home.Parts.Triangle exposing (triangle)

import Color
import Css
import Html.Attributes
import Html.Styled exposing (..)
import Styles.Colours exposing (primaryRGB, secondaryRGB)
import TypedSvg exposing (..)
import TypedSvg.Attributes exposing (..)
import TypedSvg.Types exposing (..)


triangle : Html msg
triangle =
    styled div
        [ Css.position Css.absolute, Css.left (Css.pct 50) ]
        []
        [ styled div
            [ Css.position Css.relative, Css.left (Css.pct -50) ]
            []
            [ fromUnstyled <|
                svg
                    [ viewBox 0 0 1000 1293
                    , width (px 200)
                    , height (px 200)
                    ]
                    [ polygon
                        [ points [ ( 100, 993 ), ( 500, 300 ), ( 900, 993 ) ]
                        , fill <| Fill <| secondaryRGB
                        , strokeWidth (px 2)
                        , stroke Color.black
                        ]
                        [ animateTransform
                            [ attributeName "transform"
                            , animateTransformType AnimateTransformTypeRotate
                            , from3 0 500 762
                            , to3 360 500 762
                            , dur (Duration "15s")
                            , repeatCount RepeatIndefinite
                            , TypedSvg.Attributes.style "transform-origin: center;"
                            ]
                            []
                        ]
                    , polygon
                        [ points [ ( 500, 993 ), ( 300, 646 ), ( 700, 646 ) ]
                        , fill <| Fill <| primaryRGB
                        , strokeWidth (px 2)
                        , stroke Color.black
                        ]
                        [ animateTransform
                            [ attributeName "transform"
                            , animateTransformType AnimateTransformTypeRotate
                            , from3 360 500 762
                            , to3 0 500 762
                            , dur (Duration "10s")
                            , repeatCount RepeatIndefinite
                            , TypedSvg.Attributes.style "transform-origin: center;"
                            ]
                            []
                        ]
                    , polygon
                        [ points [ ( 400, 820 ), ( 600, 820 ), ( 500, 646 ) ]
                        , fill <| Fill <| Color.black
                        , strokeWidth (px 2)
                        , stroke Color.black
                        ]
                        [ animateTransform
                            [ attributeName "transform"
                            , animateTransformType AnimateTransformTypeRotate
                            , from3 0 500 762
                            , to3 360 500 762
                            , dur (Duration "5s")
                            , repeatCount RepeatIndefinite
                            , TypedSvg.Attributes.style "transform-origin: center;"
                            ]
                            []
                        ]
                    ]
            ]
        ]
