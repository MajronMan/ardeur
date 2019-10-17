module Styles.Colours exposing (..)

import Color exposing (rgb)
import Css exposing (hex)


primaryRGB : Color.Color
primaryRGB =
    rgb (65 / 255) (179 / 255) (169 / 255)


secondaryRGB : Color.Color
secondaryRGB =
    rgb (232 / 255) (158 / 255) (181 / 255)


primary : Css.Color
primary =
    hex "41B3A9"


secondary : Css.Color
secondary =
    hex "E89EB5"


black : Css.Color
black =
    hex "071312"


grey : Css.Color
grey =
    hex "E698B1"


darkGrey : Css.Color
darkGrey =
    hex "153835"


white : Css.Color
white =
    hex "F8F8F2"
