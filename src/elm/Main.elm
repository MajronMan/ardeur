port module Main exposing (init, main, subscriptions)

import Asset
import Browser exposing (..)
import Browser.Navigation as Nav
import Css.Animations as Animation
import Flags exposing (Flags)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (Error(..))
import Json.Decode as Decode
import Json.Encode
import Model exposing (Model(..))
import Page.Article.Update as ArticleUpdate
import Ports exposing (..)
import Router exposing (route)
import Session exposing (Session(..))
import Update exposing (Msg(..), update)
import Url
import View exposing (view)


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


init : Flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    route (NotFound (Guest key)) url


subscriptions : Model -> Sub.Sub Msg
subscriptions _ =
    Sub.batch
        [ gotArticle (\text -> ArticleMsg (ArticleUpdate.ArticleLoaded text))
        , listedArticles
            (\list ->
                ArticleMsg (ArticleUpdate.ArticlesListed list)
            )
        ]
