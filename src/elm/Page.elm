module Page exposing (article, blank, home, lol, notFound)

import Html exposing (Html)
import Page.Article as Article
import Page.Article.Model as Article
import Page.Article.Update as Article
import Page.Article.View as Article
import Page.Blank as Blank
import Page.Home.Model as Home
import Page.Home.Update as Home
import Page.Home.View as Home
import Page.Lol as Lol
import Page.NotFound as NotFound


blank : msg -> Html msg
blank _ =
    Blank.view


notFound : msg -> Html msg
notFound _ =
    NotFound.view


home : Home.Model -> Html Home.Msg
home =
    Home.view


article : Article.Model -> Html Article.Msg
article =
    Article.view


lol =
    Lol.view
