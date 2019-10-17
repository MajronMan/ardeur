module Router exposing (Target, changeRoute, changeUrl, parseRoute, pass, pushUrl, redirect, requestRouteChange, route, routeParser, routeParserPath, routePath, routeToModel, shouldReload, toSession, updatePath)

import Browser exposing (UrlRequest(..))
import Browser.Navigation as Nav
import Dict
import Model exposing (Model)
import Page.Article as ArticlePage
import Page.Article.Model as ArticleModel
import Page.Home as HomePage
import Page.Home.Model as HomeModel
import Page.Lol
import Router.Routes exposing (Route(..))
import Session exposing (Session, getKey)
import Tuple as T
import Url exposing (Url)
import Url.Builder
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s, string)


type alias Target =
    { session : Session, targetRoute : Route, url : Url.Url }


routeParserPath : Route -> String
routeParserPath r =
    case r of
        Home ->
            ""

        Article a ->
            "article"

        ArticleList ->
            "article"

        Lol a ->
            "lol"

        _ ->
            ""


routePath : Route -> String
routePath r =
    let
        builderList =
            case r of
                Home ->
                    [ "" ]

                Article a ->
                    [ "article", a ]

                ArticleList ->
                    [ "article" ]

                Lol a ->
                    [ "lol" ]

                _ ->
                    [ "" ]
    in
    Url.Builder.absolute builderList []


routeParser : Route -> Parser.Parser a a
routeParser =
    s << routeParserPath


updatePath : Url -> Route -> Url
updatePath url r =
    { url | path = routePath r }


toSession : Model -> Session
toSession page =
    case page of
        Model.NotFound session ->
            session

        Model.Home home ->
            HomeModel.toSession home

        Model.Lol ( session, _ ) ->
            session

        Model.Article article ->
            ArticleModel.toSession article


parseRoute : Url -> Route
parseRoute =
    Maybe.withDefault None
        << (Parser.parse <|
                oneOf
                    [ Parser.map Home Parser.top
                    , Parser.map Article (routeParser (Article "") </> string)
                    , Parser.map ArticleList (routeParser ArticleList)
                    , Parser.map Lol (routeParser (Lol "") </> string)
                    ]
           )


routeToModel : Route -> Session -> Model
routeToModel r s =
    case r of
        Article a ->
            ArticlePage.initModel s a

        ArticleList ->
            ArticlePage.initModel s ""

        Lol a ->
            Model.Lol ( s, a )

        None ->
            Model.NotFound s

        _ ->
            HomePage.initModel s


redirect : Target -> ( Model, Cmd msg )
redirect { targetRoute, session, url } =
    ( routeToModel targetRoute session, Nav.replaceUrl (getKey session) (Url.toString url) )


pushUrl : Model -> String -> Cmd msg
pushUrl model url =
    let
        session =
            toSession model

        key =
            getKey session
    in
    Nav.pushUrl key url


requestRouteChange : Model -> Route -> Cmd msg
requestRouteChange m r =
    routePath r |> pushUrl m


changeUrl : Model -> Url -> ( Model, Cmd msg )
changeUrl m u =
    ( m, pushUrl m (Url.toString u) )


pass : Model -> ( Model, Cmd msg )
pass m =
    ( m, Cmd.none )


shouldReload : Model -> Route -> Bool
shouldReload m r =
    case m of
        Model.Home _ ->
            r /= Home

        Model.NotFound _ ->
            True

        Model.Lol _ ->
            case r of
                Lol _ ->
                    False

                _ ->
                    True

        Model.Article _ ->
            True


changeRoute : Model -> Route -> ( Model, Cmd msg )
changeRoute model targetRoute =
    let
        session =
            toSession model
    in
    case targetRoute of
        None ->
            ( Model.NotFound session, Cmd.none )

        Article name ->
            case model of
                Model.Article m ->
                    ArticlePage.reuseModel m session name

                _ ->
                    ArticlePage.init session name

        ArticleList ->
            case model of
                Model.Article m ->
                    ArticlePage.reuseModel m session ""

                _ ->
                    ArticlePage.init session ""

        Lol s ->
            Page.Lol.init session s

        _ ->
            HomePage.init session


route : Model -> Url -> ( Model, Cmd msg )
route model url =
    let
        targetRoute =
            parseRoute url
    in
    if shouldReload model targetRoute then
        changeRoute model targetRoute

    else
        pass model
