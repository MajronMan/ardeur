module Styles.Pages.Article exposing (article, articleHeader, articleText, button, list, listButtons, listHeader, listSpinner)

import Css exposing (..)
import Styles.Colours exposing (..)


article : List Style
article =
    [ width (vw 100)
    , backgroundColor white
    , color black
    , minHeight (vh 100)
    ]


articleText : List Style
articleText =
    [ margin auto
    , maxWidth (rem 50)
    , textAlign justify
    , paddingLeft (rem 1)
    , paddingRight (rem 1)
    , paddingTop (rem 5)
    , paddingBottom (rem 5)
    , lineHeight (num 1.5)
    , overflow hidden
    ]


list : List Style
list =
    [ minHeight (vh 100)
    , width (vw 100)
    , backgroundColor primary
    ]


listContent : List Style
listContent =
    [ marginLeft auto
    , marginRight auto
    , maxWidth (px 800)
    , marginTop (rem 5)
    , paddingBottom (rem 5)
    ]


listButtons : List Style
listButtons =
    listContent
        ++ [ property "display" "grid"
           , property "grid-template-columns" "repeat(auto-fill, minmax(250px, 1fr))"
           ]


listSpinner : List Style
listSpinner =
    listContent ++ [ displayFlex ]


button : List Style
button =
    [ fontSize (pt 20)
    , margin (px 20)
    ]


header : List Style
header =
    [ displayFlex
    , alignItems center
    , justifyContent center
    , height (vh 25)
    ]


articleHeader : List Style
articleHeader =
    header
        ++ [ backgroundColor black
           ]


listHeader : List Style
listHeader =
    header
        ++ [ backgroundColor secondary
           , color white
           ]
