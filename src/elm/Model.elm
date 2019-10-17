module Model exposing (..)

import Session exposing (Session)
import Page.Home.Model as HomePage
import Page.Article.Model as ArticlePage

type Model
  = NotFound Session
  | Home HomePage.Model
  | Lol (Session, String)
  | Article ArticlePage.Model

getTitle : Model -> String
getTitle m =
  case m of
  NotFound _ -> "Aucun ardeur"
  Home _ -> "L'ardeur intime"
  Article _ -> "Article"
  Lol (_, s) -> "L'ardeur de " ++ s

