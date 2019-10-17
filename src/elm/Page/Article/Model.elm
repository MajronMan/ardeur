module Page.Article.Model exposing (Model(..), toSession)

import Dict
import Session exposing (Session)


type Model
    = Article
        { session : Session
        , texts : Dict.Dict String String
        , name : String
        , list : List String
        }


toSession : Model -> Session
toSession (Article { session }) =
    session
