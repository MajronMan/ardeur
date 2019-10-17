port module Ports exposing (getArticle, gotArticle, listArticles, listedArticles)


port gotArticle : (String -> msg) -> Sub msg


port getArticle : String -> Cmd msg


port listArticles : () -> Cmd msg


port listedArticles : (List String -> msg) -> Sub msg
