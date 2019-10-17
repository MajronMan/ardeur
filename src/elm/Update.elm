module Update exposing (Msg(..), httpErrorToString, update)

import Browser exposing (UrlRequest(..))
import Browser.Navigation as Nav
import Http exposing (Error(..))
import Json.Decode as Decode
import Model exposing (Model(..))
import Page.Article.Update as Article
import Page.Home.Update as Home
import Router exposing (changeRoute, changeUrl, route)
import Router.Routes exposing (Route(..))
import Session exposing (Session)
import Signal exposing (Signal(..))
import UpdateWith exposing (updateWith)
import Url


type Msg
    = Ignored
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | HomeMsg Home.Msg
    | ArticleMsg Article.Msg
    | ChangeRoute Route


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case subUpdate message model of
        Just r ->
            r

        Nothing ->
            handleUpdate message model


subUpdate : Msg -> Model -> Maybe ( Model, Cmd Msg )
subUpdate message model =
    case ( message, model ) of
        ( HomeMsg subMsg, Model.Home home ) ->
            Home.update subMsg home
                |> updateWith Model.Home HomeMsg
                |> Just

        ( ArticleMsg subMsg, Model.Article article ) ->
            Article.update subMsg article
                |> updateWith Model.Article ArticleMsg
                |> Just

        _ ->
            Nothing


handleUpdate : Msg -> Model -> ( Model, Cmd Msg )
handleUpdate message model =
    case ( message, model ) of
        ( LinkClicked urlRequest, _ ) ->
            case urlRequest of
                Internal url ->
                    changeUrl model url

                External url ->
                    ( model, Nav.load url )

        ( UrlChanged url, _ ) ->
            route model url

        ( _, _ ) ->
            ( model, Cmd.none )


handleArticleUpdate message model =
    Article.update message model |> updateWith Model.Article ArticleMsg |> Just


httpErrorToString : Http.Error -> String
httpErrorToString err =
    case err of
        BadUrl _ ->
            "BadUrl"

        Timeout ->
            "Timeout"

        NetworkError ->
            "NetworkError"

        BadStatus _ ->
            "BadStatus"

        BadBody s ->
            "BadBody: " ++ s
